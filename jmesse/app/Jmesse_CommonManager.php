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
	 * 外部htmlの設定(http用日本語ページ)。
	 *
	 */
	function setExtHtmlHttp() {
		$this->af->setAppNe('headtagu', @file_get_contents($this->config->get('http_ja_headtagu')));
		$this->af->setAppNe('jetroheader', @file_get_contents($this->config->get('http_ja_jetro_header')));
		$this->af->setAppNe('jetrofooter', @file_get_contents($this->config->get('http_ja_jetro_footer')));
		$this->af->setAppNe('jmessetop', @file_get_contents($this->config->get('http_ja_jmesse_top')));
		$this->af->setAppNe('jmessefaqlogin', @file_get_contents($this->config->get('http_ja_jmesse_faq_login')));
	}

	/**
	 * 外部htmlの設定(https用日本語ページ)。
	 *
	 */
	function setExtHtml() {
		$this->af->setAppNe('headtagu', @file_get_contents($this->config->get('https_ja_headtagu')));
		$this->af->setAppNe('jetroheader', @file_get_contents($this->config->get('https_ja_jetro_header')));
		$this->af->setAppNe('jetrofooter', @file_get_contents($this->config->get('https_ja_jetro_footer')));
		$this->af->setAppNe('jmessetop', @file_get_contents($this->config->get('https_ja_jmesse_top')));
		$this->af->setAppNe('jmessefaqlogin', @file_get_contents($this->config->get('https_ja_jmesse_faq_login')));
	}

	/**
	 * 外部htmlの設定(http用英語ページ)。
	 *
	 */
	function setEnExtHtmlHttp() {
		$this->af->setAppNe('headtagu', @file_get_contents($this->config->get('http_en_headtagu')));
		$this->af->setAppNe('jetroheader', @file_get_contents($this->config->get('http_en_jetro_header')));
		$this->af->setAppNe('jetrofooter', @file_get_contents($this->config->get('http_en_jetro_footer')));
		$this->af->setAppNe('jmessetop', @file_get_contents($this->config->get('http_en_jmesse_top')));
		$this->af->setAppNe('jmessefaqlogin', @file_get_contents($this->config->get('http_en_jmesse_faq_login')));
	}

	/**
	 * 外部htmlの設定(https用英語ページ)。
	 *
	 */
	function setEnExtHtml() {
		$this->af->setAppNe('headtagu', @file_get_contents($this->config->get('https_en_headtagu')));
		$this->af->setAppNe('jetroheader', @file_get_contents($this->config->get('https_en_jetro_header')));
		$this->af->setAppNe('jetrofooter', @file_get_contents($this->config->get('https_en_jetro_footer')));
		$this->af->setAppNe('jmessetop', @file_get_contents($this->config->get('https_en_jmesse_top')));
		$this->af->setAppNe('jmessefaqlogin', @file_get_contents($this->config->get('https_en_jmesse_faq_login')));
	}

}
?>
