<?php
/**
 *  FairDetailQuestionnaire Form implementation.
 *
 *  @author     ids
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_FairDetailQuestionnaire extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
		'a_id' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'アンケート回答',       // Display name
			'required'    => true,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'lang' => array(
				'type'        => VAR_TYPE_STRING, // Input type
				'form_type'   => FORM_TYPE_TEXT,  // Form type
				'name'        => 'Eメール',       // Display name
				'required'    => true,            // Required Option(true/false)
				'min'         => null,            // Minimum value
				'max'         => null,            // Maximum value
				'regexp'      => null,            // String by Regexp
				'mbregexp'    => null,            // Multibype string by Regexp
				'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
				'filter'      => null,            // Optional Input filter to convert input
				'custom'      => null,            // Optional method name which
		),

	);
}



/**
 *  Jmesse_Action_FairDetailQuestionnaire
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_FairDetailQuestionnaire extends Jmesse_ActionClass
{
	public function prepare()
    {
		$this->backend->getLogger()->log(LOG_DEBUG, $this->af->get('a_id'));
		$this->backend->getLogger()->log(LOG_DEBUG, $this->af->get('lang'));

    	return null;
    }

    public function perform()
    {

		$jm_fair_qa_obj =& $this->backend->getManager('JmQA');
		$ret = $jm_fair_qa_obj->countUp($this->af->get('a_id'),$this->af->get('lang'));
		if ($ret){
			$this->af->setApp('message', 'success');

		}else{
			$this->af->setApp('message', 'error');
		}


        return 'fairDetailQuestionnaire';
    }
}
?>