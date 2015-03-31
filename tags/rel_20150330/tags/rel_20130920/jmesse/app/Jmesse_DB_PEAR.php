<?php
/**
 * 文字化け対応。
 */

require_once 'Ethna/class/DB/Ethna_DB_PEAR.php';

/**
 *
 * 文字化け対応。
 *
 * @author m.sasaki
 *
 */
class Jmesse_DB_PEAR extends Ethna_DB_PEAR
{
	function connect()
	{
		$this->db =& DB::connect($this->dsninfo, $this->persistent);
		if (DB::isError($this->db)) {
			$error = Ethna::raiseError('DB Connection Error: %s',
				E_DB_CONNECT,
				$this->db->getUserInfo());
				$error->addUserInfo($this->db);
			$this->db = null;
			return $error;
		}
		$this->db->query('SET NAMES utf8');
		return 0;
	}
}

?>
