<?php
/**
 *  Jmesse_CommonManager.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: d4af361a99e2aaa95cedee2132d1ca3f10920c6b $
 */

/**
 *  Jmesse_CommonManager
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_CommonManager extends Ethna_AppManager
{


	/**
	 * 外部htmlの設定(https用日本語ページ)。
	 *
	 */
	function setExtHtml() {
		$this->af->setAppNe('header', @file_get_contents($this->config->get('header_url')));
		$this->af->setAppNe('footer', @file_get_contents($this->config->get('footer_url')).@file_get_contents($this->config->get('footer_script_rul')));
		$this->af->setAppNe('left_menu', @file_get_contents($this->config->get('left_menu_url')));
	}

	/**
	 * 外部htmlの設定(https用英語ページ)。
	 *
	 */
	function setEnExtHtml() {
		$this->af->setAppNe('header', @file_get_contents($this->config->get('header_url_en')));
		$this->af->setAppNe('footer', @file_get_contents($this->config->get('footer_url_en')).@file_get_contents($this->config->get('footer_script_rul_en')));
		$this->af->setAppNe('left_menu', @file_get_contents($this->config->get('left_menu_url_en')));
	}


	/**
	 * 外部htmlの設定(http用日本語ページ)。
	 *
	 */
	function setExtHtmlHttp() {
		$this->af->setAppNe('header', @file_get_contents($this->config->get('http_header_url')));
		$this->af->setAppNe('footer', @file_get_contents($this->config->get('http_footer_url')).@file_get_contents($this->config->get('http_footer_script_rul')));
		$this->af->setAppNe('left_menu', @file_get_contents($this->config->get('left_menu_url')));
	}

	/**
	 * 外部htmlの設定(http用英語ページ)。
	 *
	 */
	function setEnExtHtmlHttp() {
		$this->af->setAppNe('header', @file_get_contents($this->config->get('http_header_url_en')));
		$this->af->setAppNe('footer', @file_get_contents($this->config->get('http_footer_url_en')).@file_get_contents($this->config->get('http_footer_script_rul_en')));
		$this->af->setAppNe('left_menu', @file_get_contents($this->config->get('left_menu_url_en')));
	}

}
?>
