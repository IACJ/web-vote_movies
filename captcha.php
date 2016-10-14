<?php
//	header('Access-Control-Allow-Origin: *');  
    session_start();
    $image = imagecreatetruecolor( 100, 30 );
	$bgcolor = imagecolorallocate( $image, 255, 255, 255 );
	imagefill( $image, 0, 0, $bgcolor );
	
	$captcha_code = '';
	for ($i=0; $i < 4; $i++) { 
		$fontsize = 8;
		$fontcolor = imagecolorallocate($image,rand(0,120),rand(0,120),rand(0,120));

		$data = 'abcdefghkmnprstwx345689';
		$fontcontent = substr($data,rand(0,strlen($data)-1), 1);
		$captcha_code .= $fontcontent;

		$x = ($i*100/4) +rand(5,10);
		$y = rand(5,10);

		imagestring($image, $fontsize, $x, $y, $fontcontent, $fontcolor);
	}
	$_SESSION['authcode'] = $captcha_code;


	// 创建点干扰
	for($i=0;$i<300;$i++){
        $pointcolor = imagecolorallocate($image,rand(50,200),rand(50,200),rand(50,200));    
        imagesetpixel($image,rand(1,99),rand(1,29),$pointcolor);
	}    
	//太难了，删去线干扰
	// for($i=0;$i<3;$i++){
 //        $linecolor = imagecolorallocate($image,rand(80,220),rand(80,220),rand(80,220));    
 //        imageline($image,rand(1,99),rand(1,29),rand(1,99),rand(1,29),$pointcolor);
	// }    

	header( 'content-type: image/png' );
	imagepng( $image );
	imagedestroy( $image );