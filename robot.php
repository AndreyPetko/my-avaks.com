<?php
require_once 'config.php';


//id категории куда закидываются новые товары
$category_id = 117;

$filename = 'xml/store.xml';


if(file_exists($filename)) {
		// $content = utf8_encode(file_get_contents($filename));
	// $content = str_replace("Windows-1251", "utf-8", $content);
	// $handle = fopen($fname, "r+");
	// $contents = fread($handle, filesize($fname));
// $r=fopen($filename,'r');
// $text=fread($r,filesize($filename));
// fclose($r);
// $text = str_replace("Windows-1251", "utf-8", $text);
// $w=fopen($filename,'w');
// fwrite($w,$text);
// fclose($w);

	$xml = simplexml_load_file($filename);


}


// print_r($xml);
// echo "<pre>";

foreach ($xml->store as $stores) {
	$storeItems = $stores->items;

	$counter = 0;

// 	foreach ($storeItems->item as $item) {

// 		if($item->code) {
// 			$goods_list[$counter]['code'] = strval($item->code);
// 			$goods_list[$counter]['qty'] = intval($item->count);
// 			// $goods_list[$counter]['subcat'] = iconv('utf-8', 'windows-1251', strval($item->typeg));
// 			// $goods_list[$counter]['mfr']=iconv("utf-8", "windows-1251",strval($item->firmag));
// 			// $goods_list[$counter]['model']=iconv("utf-8", "windows-1251",strval($item->modelg));
// 			// $goods_list[$counter]['category']=iconv("utf-8", "windows-1251",strval($item->groupg));
// 			// $goods_list[$counter]['subcategory']=iconv("utf-8", "windows-1251",strval($item->typeg));
// 			$goods_list[$counter]['subcat'] = strval($item->typeg);
// 			$goods_list[$counter]['mfr']= strval($item->firmag);
// 			$goods_list[$counter]['model']= strval($item->modelg);
// 			$goods_list[$counter]['category']= strval($item->groupg);
// 			$goods_list[$counter]['subcategory']= strval($item->typeg);
// 			// $goods_list[$counter]['weight']=strval($item->weight);
// 			$goods_list[$counter]['gross']=strval($item->gross);

// 			$pricess = $item->prices->price;


// 			$weight = strval($item->weight);

// 			$weight = str_replace(',','.',$weight);

// 			$goods_list[$counter]['weight'] = $weight;

// 			foreach ($pricess as $pricesss) {
// 				if(intval($pricesss->order) < 6) {
// 					$pr_arr[intval($pricesss->order)] = floatval($pricesss->value);
// 				}
// 			}

// 			$goods_list[$counter]['prices'] = $pr_arr;



// 			$counter++;
// 		}

// 	}
// }


	foreach ($storeItems->item as $item) {

		if($item->code) {
			$element['code'] = strval($item->code);
			$element['qty'] = intval($item->count);

			$element['subcat'] = strval($item->typeg);
			$element['mfr']= strval($item->firmag);
			$element['model']= strval($item->modelg);
			$element['category']= strval($item->groupg);
			$element['subcategory']= strval($item->typeg);

			$element['gross']=strval($item->gross);

			$pricess = $item->prices->price;


			$weight = strval($item->weight);

			$weight = str_replace(',','.',$weight);

			$element['weight'] = $weight;

			foreach ($pricess as $pricesss) {
				if(intval($pricesss->order) < 6) {
					$pr_arr[intval($pricesss->order)] = floatval($pricesss->value);
				}
			}

			$element['prices'] = $pr_arr;


			$goods_list[] = $element;

			// $counter++;
		}

	}
}





$DBH = new PDO("mysql:host=" . DB_HOSTNAME . ";dbname=" . DB_DATABASE, DB_USERNAME, DB_PASSWORD,array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\''));



for ($i=0; $i < sizeof($goods_list); $i++) { 
	if($goods_list[$i]['code'] > 11000 || $goods_list[$i]['code'] < 10000 ) {
		$STH = $DBH->query("select count(*) as count from `".DB_PREFIX."product` WHERE  `sku` LIKE  '".$goods_list[$i]['code']."'");
		$STH->setFetchMode(PDO::FETCH_ASSOC);

		$res = $STH->fetch();


		if($res['count'] > 0) {


			if($goods_list[$i]['weight'] != 0) {
				$DBH->query("UPDATE `".DB_PREFIX."product` SET  `quantity` =  '".$goods_list[$i]['qty']."', `price` =  '".$goods_list[$i]['prices'][2]."', `weight` =  '".$goods_list[$i]['weight']."', model = '" . $goods_list[$i]['code'] . "' WHERE  `sku` LIKE  '".$goods_list[$i]['code']."'");
			} else {
				$DBH->query("UPDATE `".DB_PREFIX."product` SET  `quantity` =  '".$goods_list[$i]['qty']."', `price` =  '".$goods_list[$i]['prices'][2]."', 
					model = '" . $goods_list[$i]['code'] . "' WHERE  `sku` LIKE  '".$goods_list[$i]['code']."'");
			}



			$STH = $DBH->query("select product_id from `".DB_PREFIX."product` WHERE  `sku` LIKE  '".$goods_list[$i]['code']."'");
			$STH->setFetchMode(PDO::FETCH_ASSOC);

			$product_id = $STH->fetch();
			$product_id = $product_id['product_id'];

		//цены
			$prices = $goods_list[$i]['prices'];

			$DBH->query("SELECT count(*) as count FROM " . DB_PREFIX . "prices WHERE product_id = " . $product_id);
			$STH->setFetchMode(PDO::FETCH_ASSOC);

			$cres = $STH->fetch();

			if($res['count'] > 0) {
				$DBH->query("UPDATE " . DB_PREFIX ."prices SET price_1 = " . $prices[1] . ", price_2 = " . $prices[2] . ", price_3 = " . $prices[3] . ", price_4 = " . $prices[4] . ", price_5 = " . $prices[5] . " WHERE product_id =  " .  $product_id);
			} else {
				$DBH->query("INSERT INTO `" . DB_PREFIX . "prices` (`product_id`, `price_1`, `price_2`, `price_3`, `price_4`, `price_5`) VALUES ('" . $product_id . "', '" . $prices[1] . "', '" . $prices[2] . "', '" . $prices[3] . "', '" .  $prices[4] . "', '" . $prices[5] . "')");
			}



		} else {
			$date_str=date('Y-m-d');
			$date_str1=date('Y-m-d H:i:s');


		//Создаем продукт
			$DBH->query("INSERT INTO `" . DB_PREFIX . "product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) 
				VALUES (NULL, '" . $goods_list[$i]['code'] . "', '" . $goods_list[$i]['code'] . "', '', '', '', '', '', '', '" . $goods_list[$i]['qty'] . "', '5', NULL, '', '1', '" . $goods_list[$i]['prices'][2] . "', '0', '', NOW(), '" . $goods_list[$i]['weight'] . "', '1', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '0', NOW(), NOW())");


		//Получаем id добавленого продукта
			$lastId = $DBH->lastInsertId();
			$subcat = trim($goods_list[$i]['subcat']);

		//Добавляем описание добавленому продукту
			$STH = $DBH->prepare("INSERT INTO `" . DB_PREFIX . "product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES (:id, '1', :model, :subcat, '', :model, :mfr, :model)");

			$STH->bindParam(':id', $lastId);
			$STH->bindParam(':model', $goods_list[$i]['model']);
			$STH->bindParam(':subcat', $subcat);
			$STH->bindParam(':mfr', $goods_list[$i]['mfr']);
			$STH->execute();


		// $STH = $DBH->prepare("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = :id, store_id = 0");
		// $STH->bindParam(':id', $lastId);
		// $STH->execute();


			$DBH->query("INSERT INTO `".DB_PREFIX."product_to_category` (`product_id`, `category_id`) VALUES ('" . $lastId . "', '26')");


			$DBH->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = " . $lastId . ", category_id = " . $category_id );



		//цены
			$prices = $goods_list[$i]['prices'];


			$DBH->query("INSERT INTO `" . DB_PREFIX . "prices` (`product_id`, `price_1`, `price_2`, `price_3`, `price_4`, `price_5`) VALUES ('" . $lastId . "', '" . $prices[1] . "', '" . $prices[2] . "', '" . $prices[3] . "', '" .  $prices[4] . "', '" . $prices[5] . "')");
		}
	}
}


// print_r($goods_list);
