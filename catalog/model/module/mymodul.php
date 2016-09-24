<?php

class ModelModulemymodul extends Model {

	public function getValues() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "social");

		$social = [];

		foreach($query->rows as $row )
		{
			$social[$row['name']] = $row['value'];
		}

		return $social;
	}


	public function getCategories() {
		$result = $this->db->query("SELECT des.name, cat.image FROM " . DB_PREFIX . "category as cat
		LEFT JOIN " . DB_PREFIX . "category_description as des
		ON cat.category_id = des.category_id
		WHERE top = 1 
		ORDER BY sort_order");

		return $result;
	}


}