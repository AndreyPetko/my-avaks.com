<?php
class ModelAccountLoginza2 extends Model 
{
	public function checkNew($data)
	{
		$identitis = array();
		
		$identitis[] = $data['identity'];
		$identitis[] = str_replace("http://", "https://", $data['identity']);
		$identitis[] = str_replace("https://", "http://", $data['identity']);
		$identitis[] = str_replace("https://", "https://www.", $data['identity']);
		$identitis[] = str_replace("http://", "http://www.", $data['identity']);
		$identitis[] = str_replace("http://www.", "http://", $data['identity']);
		$identitis[] = str_replace("https://www.", "https://", $data['identity']);
		$identitis[] = str_replace("https://www.", "", $data['identity']);
		$identitis[] = str_replace("https://", "", $data['identity']);
		$identitis[] = str_replace("http://www.", "", $data['identity']);
		$identitis[] = str_replace("http://", "", $data['identity']);
		$identitis[] = str_replace("https://www.", "http://", $data['identity']);
		
		
		
		for($i=0; $i<count($identitis); $i++)
		{
			$identitis[$i] = " loginza2_identity='".$this->db->escape($identitis[$i])."' ";
		}
		
		$wh = implode(" OR ", $identitis);
		
		$check = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer 
								   WHERE ".$wh);
		if( empty($check->rows) && $this->config->get('loginza2_dobortype') == 'one' )
		{
			return false;
		}
		elseif( !empty( $check->row ) )
		{
			$upd = '';
			
			if( !empty($data['firstname']) )
			{
				$upd .= " firstname = '".$this->db->escape($data['firstname'])."', ";
			}
			
			if( !empty($data['lastname']) )
			{
				$upd .= " lastname = '".$this->db->escape($data['lastname'])."', ";
			}
			
			if( !empty($data['telephone']) )
			{
				$upd .= " telephone = '".$this->db->escape($data['telephone'])."', ";
			}
			
			if( !empty($data['email']) )
			{
				$upd .= " email = '".$this->db->escape($data['email'])."', ";
			}
			
			$this->db->query("UPDATE " . DB_PREFIX . "customer 
							  SET
							  ". $upd ."
							  
								loginza2_data = '".$this->db->escape($data['data'])."',
								ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'
							  WHERE
							    loginza2_identity = '" .$this->db->escape($data['identity']) . "'");
			

			/* start specific block: system/library/customer.php */
			if( !empty($check->row['cart']) && is_string($check->row['cart']) ) {
				$cart = unserialize($check->row['cart']);
				
				foreach ($cart as $key => $value) {
					if (!array_key_exists($key, $this->session->data['cart'])) {
						$this->session->data['cart'][$key] = $value;
					} else {
						$this->session->data['cart'][$key] += $value;
					}
				}			
			}

			if ( !empty($check->row['wishlist']) && is_string($check->row['wishlist'])) {
				if (!isset($this->session->data['wishlist'])) {
					$this->session->data['wishlist'] = array();
				}
								
				$wishlist = unserialize($check->row['wishlist']);
			
				foreach ($wishlist as $product_id) {
					if (!in_array($product_id, $this->session->data['wishlist'])) {
						$this->session->data['wishlist'][] = $product_id;
					}
				}			
			}
			/* end specific block */

			
			return $check->row['customer_id'];
		}
		else
		{
			return false;
		}
	}

	public function addCustomer($data)
	{
		/* kin insert metka: c1 */
		$fields = array("firstname", "lastname", "email", "telephone", "company", "postcode",
		"country", "zone", "city", "address_1", "link" );
		
		foreach($fields as $field)
		{
			if( !isset($data[$field]) )
			{
				$data[$field] = '';
			}
		}
		/* end kin metka: c1 */
		
		/* start specific block: catalog/model/account/customer.php */
		$customer_group_id = $this->config->get('config_customer_group_id');
		$customer_id = '';
		
		$approved = 0;
		
		if( $this->config->has('config_customer_approval') )
		{
			if( $this->config->get('config_customer_approval') )
			{
				$approved = 1;
			}
		}
		else
		{
			$this->load->model('account/customer_group');
			$customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer_group_id);
			if( !$customer_group_info['approval'] )
			{
				$approved = 1;
			}
		}
		
		if( empty($data['customer_id']) )
		{
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer 
							  SET
								firstname = '".$this->db->escape($data['firstname'])."',
								lastname = '".$this->db->escape($data['lastname'])."',
								email = '".$this->db->escape($data['email'])."',
								telephone = '".$this->db->escape($data['telephone'])."',
							    loginza2_identity = '" .$this->db->escape($data['identity']) . "',
								loginza2_provider = '".$this->db->escape($data['provider']) ."',
								loginza2_data = '".$this->db->escape($data['data'])."',
								loginza2_link = '".$this->db->escape($data['link'])."',
								ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "',
								approved = '".$approved."',
								customer_group_id = '" . (int)$customer_group_id . "', 
								status = '1', 
								date_added = NOW()");
								
			$customer_id = $this->db->getLastId();
		}
		else
		{
			$this->db->query("UPDATE " . DB_PREFIX . "customer 
							  SET
								firstname = '".$this->db->escape($data['firstname'])."',
								lastname = '".$this->db->escape($data['lastname'])."',
								email = '".$this->db->escape($data['email'])."',
								telephone = '".$this->db->escape($data['telephone'])."',
							    ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'
							  WHERE 
								customer_id='".(int)$data['customer_id']."'");
			$customer_id = $data['customer_id'];
		}
		/* end specific block */
		
		
		if( $this->config->get('loginza2_save_to_addr')!='customer_only' )
		{
			if( empty($data['customer_id']) )
			{
			
				$this->db->query("INSERT INTO " . DB_PREFIX . "address 
				SET 
				customer_id = '" . (int)$customer_id . "', 
				firstname = '" . $this->db->escape($data['firstname']) . "', 
				lastname = '" . $this->db->escape($data['lastname']) . "', 
				company = '" . $this->db->escape($data['company']) . "', 
				address_1 = '" . $this->db->escape($data['address_1']) . "', 
				postcode = '" . $this->db->escape($data['postcode']) . "', 
				city = '" . $this->db->escape($data['city']) . "', 
				zone_id = '" . (int)$data['zone'] . "', 
				country_id = '" . (int)$data['country'] . "'");
		
				$address_id = $this->db->getLastId();
		
				$this->db->query("UPDATE " . DB_PREFIX . "customer 
						  SET address_id = '" . (int)$address_id . "' 
						  WHERE customer_id = '" . (int)$customer_id . "'");
			}
			else
			{
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer 
										   WHERE customer_id='".(int)$data['customer_id']."'");
				
				if( !empty( $query->row['address_id'] ) )
				{
					$this->db->query("UPDATE " . DB_PREFIX . "address 
						SET  
							firstname = '" . $this->db->escape($data['firstname']) . "', 
							lastname = '" . $this->db->escape($data['lastname']) . "', 
							company = '" . $this->db->escape($data['company']) . "', 
							address_1 = '" . $this->db->escape($data['address_1']) . "', 
							postcode = '" . $this->db->escape($data['postcode']) . "', 
							city = '" . $this->db->escape($data['city']) . "', 
							zone_id = '" . (int)$data['zone'] . "', 
							country_id = '" . (int)$data['country'] . "'
						WHERE
							address_id = '" . (int)$query->row['address_id'] . "'");
				}
			}
			
			
			
		}
		
		/* end kin metka: c1 */
		
		return array($customer_id, $approved);
	}
	
	public function checkApproved($customer_id)
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer 
										   WHERE customer_id='".(int)$customer_id."'");
		
		return $query->row['approved'];
		
	}
	
	public function getOldDoborData($loginza_data)
	{
		$RES = array(
			"firstname" => "", 
			"lastname" => "", 
			"email" => "", 
			"telephone" => "",
		
		
			"company" => "", 
			"address_1" => "", 
			"postcode" => "", 
			"city" => "", 
			"zone" => "", 
			"country" => ""
		);
		
		
		$query = $this->db->query("SELECT * 
								   FROM `" . DB_PREFIX . "customer` 
								   WHERE 
									loginza2_identity='".$this->db->escape($loginza_data['data']['identity'])."'
								");
		
		if( empty($query->row) ) return;
		
		$RES['telephone'] = $query->row['telephone'];
		$RES['email'] = $query->row['email'];
		$RES['firstname'] = $query->row['firstname'];
		$RES['lastname'] = $query->row['lastname'];
		
		if( !empty($query->row['address_id']) )
		{
			$query_address = $this->db->query("SELECT * 
								   FROM `" . DB_PREFIX . "address` 
								   WHERE 
									address_id='".(int)$query->row['address_id']."'
								");
			
			if( !empty($query_address->row) )
			{
				
				$RES['company'] = $query_address->row['company'];
				$RES['address_1'] = $query_address->row['address_1'];
				$RES['postcode'] = $query_address->row['postcode'];
				
				$RES['city'] = $query_address->row['city'];
				$RES['zone'] = $query_address->row['zone_id'];
				$RES['country'] = $query_address->row['country_id'];
			}
		}
		
		return $RES;
	}
}

?>