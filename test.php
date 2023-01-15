<?php
	function ExitAlert($msg){
    exit("gg.alert('".$msg."')");
	}
	$JDecode = json_decode(file_get_contents('php://input'),true); 
	$keys_array = array('test','somekey');
	$get_key = $JDecode["InputKey"]
	if(array_key_exist($get_key, $keys_array)) {
		ExitAlert("Key Exist");
	} else {
		ExitAlert("Key Not Exist");
	}
?>
