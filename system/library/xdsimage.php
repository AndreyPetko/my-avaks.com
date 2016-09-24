<?php
class Xdsimage {
	private $file;
	private $image;
	private $info;

	public function __construct($file) {
		if (file_exists($file)) {
			$this->file = $file;

			$info = getimagesize($file);

			$this->info = array(
				'width'  => $info[0],
				'height' => $info[1],
				'bits'   => isset($info['bits']) ? $info['bits'] : '',
				'mime'   => isset($info['mime']) ? $info['mime'] : ''
			);

			$this->xdsimage = $this->create($file);
		} else {
			exit('Error: Could not load image ' . $file . '!');
		}
	}

	private function create($image) {
		$mime = $this->info['mime'];

		if ($mime == 'image/gif') {
			return imagecreatefromgif ($image);
		} elseif ($mime == 'image/png') {
			return imagecreatefrompng($image);
		} elseif ($mime == 'image/jpeg') {
			return imagecreatefromjpeg($image);
		}
	}

	public function save($file, $quality = 100) {
		$info = pathinfo($file);

		$extension = strtolower($info['extension']);

		if (is_resource($this->xdsimage)) {
			if ($extension == 'jpeg' || $extension == 'jpg') {
				imagejpeg($this->xdsimage, $file, $quality);
			} elseif ($extension == 'png') {
				imagepng($this->xdsimage, $file);
			} elseif ($extension == 'gif') {
				imagegif ($this->xdsimage, $file);
			}

			imagedestroy($this->xdsimage);
		}
	}

	public function resize($width = 0, $height = 0, $default = '') {
		if (!$this->info['width'] || !$this->info['height']) {
			return;
		}
		
		 $x = $this->info['width'];
            $y = $this->info['height'];

            // old images width will fit
            if(($x / $y) < ($width/$height)){
                $scale = $width/$x;
                $newX = 0;
                $newY = - ($scale * $y - $height) / 2;

            // else old image's height will fit
            }else{
                $scale = $height/$y;
                $newX = - ($scale * $x - $width) / 2;
                $newY = 0;
            }

            $image_old = $this->xdsimage;
            $this->xdsimage = imagecreatetruecolor($width, $height);


            $new_width =  $scale * $x;
            $new_height = $scale * $y;

            // now use imagecopyresampled
            imagecopyresampled($this->xdsimage, $image_old, $newX, $newY, 0, 0, $new_width, $new_height, $x, $y);

		if (isset($this->info['mime']) && $this->info['mime'] == 'image/png') {		
			imagealphablending($this->xdsimage, false);
			imagesavealpha($this->xdsimage, true);
			$background = imagecolorallocatealpha($this->xdsimage, 255, 255, 255, 127);
			imagecolortransparent($this->xdsimage, $background);
		} else {
			$background = imagecolorallocate($this->xdsimage, 255, 255, 255);
		}
        imagedestroy($image_old);
           
        $this->info['width']  = $width;
        $this->info['height'] = $height;
	}
	
	public function resize2($width = 0, $height = 0, $default = '') {
		if (!$this->info['width'] || !$this->info['height']) {
			return;
		}

		$xpos = 0;
		$ypos = 0;
		$scale = 1;

		$scale_w = $width / $this->info['width'];
		$scale_h = $height / $this->info['height'];

		if ($default == 'w') {
			$scale = $scale_w;
		} elseif ($default == 'h') {
			$scale = $scale_h;
		} else {
			$scale = $scale_w;
		}

		if ($scale == 1 && $scale_h == $scale_w && $this->info['mime'] != 'image/png') {
			return;
		}

		if(  $scale > 1 ) {
			$new_width = (int)($this->info['width']);
			$new_height = (int)($this->info['height']);
			
			if ($new_height < $height) {
				$new_new_height = $new_height;
			} else {
				$new_new_height = $height;
				$ypos = (int)(($height - $new_height) / 2);
			}
			
		} else {
			$new_width = (int)($this->info['width'] * $scale);
			$new_height = (int)($this->info['height'] * $scale);
			
			if ($new_height < $height) {
				$new_new_height = $new_height;
			} else {
				$new_new_height = $height;
				$ypos = (int)(($height - $new_height) / 2);
			}
		}
		

		$image_old = $this->xdsimage;
		$this->xdsimage = imagecreatetruecolor($new_width, $new_new_height);

		if (isset($this->info['mime']) && $this->info['mime'] == 'image/png') {
			imagealphablending($this->xdsimage, false);
			imagesavealpha($this->xdsimage, true);
			$background = imagecolorallocatealpha($this->xdsimage, 255, 255, 255, 127);
			imagecolortransparent($this->xdsimage, $background);
		} else {
			$background = imagecolorallocate($this->xdsimage, 255, 255, 255);
		}

		imagefilledrectangle($this->xdsimage, 0, 0, $width, $height, $background);

		imagecopyresampled($this->xdsimage, $image_old, $xpos, $ypos, 0, 0, $new_width, $new_height, $this->info['width'], $this->info['height']);
		imagedestroy($image_old);

		$this->info['width']  = $width;
		$this->info['height'] = $height;
	}

	public function watermark($file, $position = 'bottomright') {
		$watermark = $this->create($file);

		$watermark_width = imagesx($watermark);
		$watermark_height = imagesy($watermark);

		switch($position) {
			case 'topleft':
				$watermark_pos_x = 0;
				$watermark_pos_y = 0;
				break;
			case 'topright':
				$watermark_pos_x = $this->info['width'] - $watermark_width;
				$watermark_pos_y = 0;
				break;
			case 'bottomleft':
				$watermark_pos_x = 0;
				$watermark_pos_y = $this->info['height'] - $watermark_height;
				break;
			case 'bottomright':
				$watermark_pos_x = $this->info['width'] - $watermark_width;
				$watermark_pos_y = $this->info['height'] - $watermark_height;
				break;
		}

		imagecopy($this->xdsimage, $watermark, $watermark_pos_x, $watermark_pos_y, 0, 0, 120, 40);

		imagedestroy($watermark);
	}

	public function crop($top_x, $top_y, $bottom_x, $bottom_y) {
		$image_old = $this->xdsimage;
		$this->xdsimage = imagecreatetruecolor($bottom_x - $top_x, $bottom_y - $top_y);

		imagecopy($this->xdsimage, $image_old, 0, 0, $top_x, $top_y, $this->info['width'], $this->info['height']);
		imagedestroy($image_old);

		$this->info['width'] = $bottom_x - $top_x;
		$this->info['height'] = $bottom_y - $top_y;
	}

	public function rotate($degree, $color = 'FFFFFF') {
		$rgb = $this->html2rgb($color);

		$this->xdsimage = imagerotate($this->xdsimage, $degree, imagecolorallocate($this->xdsimage, $rgb[0], $rgb[1], $rgb[2]));

		$this->info['width'] = imagesx($this->xdsimage);
		$this->info['height'] = imagesy($this->xdsimage);
	}

	private function filter($filter) {
		imagefilter($this->xdsimage, $filter);
	}

	private function text($text, $x = 0, $y = 0, $size = 5, $color = '000000') {
		$rgb = $this->html2rgb($color);

		imagestring($this->xdsimage, $size, $x, $y, $text, imagecolorallocate($this->xdsimage, $rgb[0], $rgb[1], $rgb[2]));
	}

	private function merge($file, $x = 0, $y = 0, $opacity = 100) {
		$merge = $this->create($file);

		$merge_width = imagesx($merge);
		$merge_height = imagesy($merge);

		imagecopymerge($this->xdsimage, $merge, $x, $y, 0, 0, $merge_width, $merge_height, $opacity);
	}

	private function html2rgb($color) {
		if ($color[0] == '#') {
			$color = substr($color, 1);
		}

		if (strlen($color) == 6) {
			list($r, $g, $b) = array($color[0] . $color[1], $color[2] . $color[3], $color[4] . $color[5]);
		} elseif (strlen($color) == 3) {
			list($r, $g, $b) = array($color[0] . $color[0], $color[1] . $color[1], $color[2] . $color[2]);
		} else {
			return false;
		}

		$r = hexdec($r);
		$g = hexdec($g);
		$b = hexdec($b);

		return array($r, $g, $b);
	}
}
