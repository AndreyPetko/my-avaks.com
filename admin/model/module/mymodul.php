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


	public function getAdminValues() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "social");

		$social = [];

		foreach($query->rows as $row )
		{
			$social[] = $row;
		}

		return $social;

	}

	public function updateSocials($post) {
		unset($post['mymodul_status']);


		foreach ($post as $name => $value) {
			$this->updateSocial($name, $value);
		}

	}

	public function updateSocial($name, $value) {
		$value = (int)$value;

		$this->db->query("UPDATE " . DB_PREFIX . "social SET value = '" . $value . "' WHERE name = '" . $name . "'");
	}

}