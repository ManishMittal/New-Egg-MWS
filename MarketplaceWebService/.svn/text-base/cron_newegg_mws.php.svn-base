<?php
/*
 * @support
 * http://www.opensourcetechnologies.com/contactus.html
 * sales@opensourcetechnologies.com
 * */
set_time_limit(0) ;
	if (is_file('./../config.php')) {
		require_once('./../config.php');
	}
	$con = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD,DB_DATABASE);
	$q="select `key`,`value` from `" . DB_PREFIX . "setting` where code ='newegg_mws'";
	$qr=mysqli_query($con,$q) or die($q.mysqli_error($con));
	while($r=mysqli_fetch_object($qr))
	{
		$var=$r->key;
		$$var=$r->value;
	}
	if($newegg_mws_status)
	{
		$single_quantity=$newegg_mws_minimum_quantity_single;
		$newegg_mws_single=$newegg_mws_single;
		$i=0;
		$q="select `sku`,`quantity` from `" . DB_PREFIX . "product` where `sku`<>'' and `status`='1'";
		$qr=mysqli_query($con,$q) or die($q.mysqli_error($con));
		while($result=mysqli_fetch_array($qr))
		{
			if($i%10000==0)
			{
				$feed='<?xml version="1.0" encoding="UTF-8"?>
<NeweggEnvelope xsi:noNamespaceSchemaLocation="NeweggEnvelope.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<Header>
<DocumentVersion>2.0</DocumentVersion>
</Header>
<MessageType>Inventory</MessageType>
<Message>
<Inventory>
';
			}
			$quantity=$result['quantity'];
			$sku=$result['sku'];
			if($newegg_mws_minimum_quantity_single!='' and $quantity<$newegg_mws_minimum_quantity_single)
			{
				$feed .='<Item>
<SellerPartNumber>'.$sku.'</SellerPartNumber>
<WarehouseLocation>USA</WarehouseLocation>
<FulfillmentOption>Seller</FulfillmentOption>
<Inventory>0</Inventory>
</Item>
';
			}
			else
			{
				if($newegg_mws_single>0)
					$newegg_mws_single_quantity=ceil(($quantity*$newegg_mws_single)/100);
				else
					$newegg_mws_single_quantity=$quantity;
				$feed .='<Item>
<SellerPartNumber>'.$sku.'</SellerPartNumber>
<WarehouseLocation>USA</WarehouseLocation>
<FulfillmentOption>Seller</FulfillmentOption>
<Inventory>'.$newegg_mws_single_quantity.'</Inventory>
</Item>
';
			}
			
			$i++;
			if($i%10000==0)
			{
				
				$feed.='</Inventory>
</Message>
</NeweggEnvelope>
';
				$feed = trim($feed);
				$remote_file='/Inbound/Inventory/feed_'.$i.'_'.date('d_m_y').'.xml';
				file_put_contents('./newegg_feed/feed_'.$i.'.xml',$feed);
				$ftp_server=$newegg_mws_ftp_server;
				$ftp_user_name=$newegg_mws_ftp_username;
				$ftp_user_pass=$newegg_mws_ftp_password;
				$conn_id = ftp_connect($ftp_server);

				// login with username and password
				$login_result = ftp_login($conn_id, $ftp_user_name, $ftp_user_pass);
				ftp_pasv($conn_id, true);
				// upload a file
				if (ftp_put($conn_id, $remote_file,'./newegg_feed/feed_'.$i.'.xml', FTP_ASCII)) {
					echo "successfully uploaded $remote_file \n";
				} else {
					echo "There was a problem while uploading $remote_file \n";
				}
				// close the connection
				ftp_close($conn_id);
			}
		}
		if($i%10000!=0)
		{
			
			$feed.='</Inventory>
</Message>
</NeweggEnvelope>
';
			$feed = trim($feed);
			$remote_file='/Inbound/Inventory/feed_'.$i.'_'.date('d_m_y').'.xml';
			file_put_contents('./newegg_feed/feed_'.$i.'.xml',$feed);
			$ftp_server=$newegg_mws_ftp_server;
			$ftp_user_name=$newegg_mws_ftp_username;
			$ftp_user_pass=$newegg_mws_ftp_password;
			$conn_id = ftp_connect($ftp_server);

			// login with username and password
			$login_result = ftp_login($conn_id, $ftp_user_name, $ftp_user_pass);
			ftp_pasv($conn_id, true);
			// upload a file
			if (ftp_put($conn_id, $remote_file,'./newegg_feed/feed_'.$i.'.xml', FTP_ASCII)) {
				echo "successfully uploaded $remote_file \n";
			} else {
				echo "There was a problem while uploading $remote_file \n";
			}
			// close the connection
			ftp_close($conn_id);
		}


	}
	else echo "Module is Disabled";
     
