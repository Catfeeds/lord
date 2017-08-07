<?php
header("Content-type: text/html; charset=utf-8");
// ini_set("display_errors","On");error_reporting(E_ALL);//E_ERROR | E_WARNING | E_PARSE
require_once '../manage/checkPriv.php';
require_once '../include/database.class.php';
$ut_now = time();
$pathes = array(
	"mall_goods"=>"商品列表图",
	"mall_exchange"=>"兑换列表图",
	"mall_recharge"=>"充值列表图",
	"mall_prop"=>"背包道具图",
	"goods_control"=>"礼包弹出图",
	"goods_controltitle"=>"礼包标题图",
	"goods_controllobby"=>"礼包大厅图",
	"goods_controlbutton"=>"礼包按钮图",
);
$maxversion = 0;
$sql = "SELECT max(`version`) as version FROM `lord_game_version` WHERE `name` = 'verfile' AND `is_done` = 0 LIMIT 1";
$res = $db->query($sql)->fetch(PDO::FETCH_ASSOC);
$maxversion = $res ? $res['version'] : 1;
$type = isset($_REQUEST['type']) ? trim($_REQUEST['type']) : 'add';//add delete modify
$ispost = isset($_REQUEST['ispost']) ? intval($_REQUEST['ispost']) : 0;
$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
if ($type=='delete') {
	$errno = 0; $error = "";
	$sql = "SELECT * FROM `lord_game_file` WHERE `id` = $id AND `is_del` > 0";
	$res = $db->query($sql)->fetch(PDO::FETCH_ASSOC);
	if ( $res ) {
		$errno = 1; $error = "已删除的不可再操作。";
		echo json_encode(array('errno'=>$errno, 'error'=>$error));
		exit;
	}
	$sql = "UPDATE `lord_game_file` SET `version` = $maxversion, `ver_upd` = $maxversion, `ver_del` = $maxversion, `is_del` = 1, `update_time` = $ut_now WHERE `id` = $id";
	$res = $pdo->getDB(1)->exec($sql);
	if ( !$res ) {
		$errno = 9; $error = "查询错误。";
	}
	echo json_encode(array('errno'=>$errno, 'error'=>$error));
	exit;
}
$data = array();
if ($type=='modify') {
	$sql = "SELECT * FROM `lord_game_file` WHERE `id` = $id AND `is_del` > 0";
	$res = $db->query($sql)->fetch(PDO::FETCH_ASSOC);
	if ( $res ) {
		echo "已删除的不可再操作。";
		exit;
	}
	$sql = "SELECT * FROM `lord_game_file` WHERE `id` = $id";
	$data = $db->query($sql)->fetch(PDO::FETCH_ASSOC);
	if ( !$data ) {
		echo "出错了。";
		exit;
	}
}
if ($ispost) {
	$errno = 0; $error = "";
	$channel = isset($_REQUEST['channel']) ? trim($_REQUEST['channel']) : '';
	$channot = isset($_REQUEST['channot']) ? trim($_REQUEST['channot']) : '';
	$path = isset($_REQUEST['path']) ? trim($_REQUEST['path']) : '';
	if ( $type == 'add' ) {
		$fileid = isset($_REQUEST['fileid']) ? trim($_REQUEST['fileid']) : '';
		$fileids = $fileid ? explode(" ", $fileid) : array();
	} elseif ( $type == 'modify' ) {
		$fileid = isset($_REQUEST['fileid']) ? intval($_REQUEST['fileid']) : 0;
	}
	$version = $maxversion;
	$create_time = $update_time = $ut_now;
	if ( $type == 'add' ) {
		foreach ( $fileids as $k => $fileid )
		{
			$sql = "INSERT INTO `lord_game_file` ( `channel`, `channot`, `path`, `fileid`, `version`, `ver_ins`, `create_time`, `update_time` )
			VALUES ( '$channel', '$channot', '$path', $fileid, $version, $version, $create_time, $update_time )";
			$res = $pdo->getDB(1)->exec($sql);
			$res = $id = $pdo->getDB(1)->lastInsertId();
		}
	}
	if ( $type == 'modify' ) {
		$sql = "SELECT * FROM `lord_game_file` WHERE `id` = $id AND `is_del` > 0";
		$res = $db->query($sql)->fetch();
		if ( $res ) {
			$errno = 1; $error = "已删除的不可再操作。";
			echo json_encode(array('errno'=>$errno, 'error'=>$error));
			exit;
		}
		$sql = "UPDATE `lord_game_file` SET `channel`='$channel',`channot`='$channot',`path`='$path',`fileid`=$fileid,`version`=$version,`ver_upd`=$version,`update_time`=$update_time WHERE `id`=$id";
		$res = $pdo->getDB(1)->exec($sql);
	}
	if ( !$res ) {
		$errno = 9; $error = "查询错误。";
	}
	$res = json_encode(array('errno'=>$errno, 'error'=>$error));
	if ( !$errno ) {
		header('Location: mallFileList.php');
	}
	else {
		echo $res;
		exit;
	}
}

?>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<link type="text/css" href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<style type="text/css">
table.table{ font-size: 12px;width: 95%!important;}
table.table th{ white-space: nowrap;}
label{display: inline;}
.in_t{width: 300px;height: 30px!important;margin: 0}
.in_t2{width: 100px;height: 30px!important;margin: 0}
.in_a{width: 300px;height: 100px!important;margin: 0}
</style>
<script>
$(function(){
	//
});
</script>

<body>
<div style="position:absolute;left:0;top:0;padding:0 10px;">

<fieldset>
	<legend>商城物品图片-<?php if($type=='add'){?>创建<?php }else{?>编辑<?php }?></legend>
	<form action="mallFileAdd.php" method="post">
		<input type="hidden" name="ispost" value="1" />
		<input type="hidden" name="type" value="<?=$type?>" />
		<input type="hidden" name="id" value="<?php if($data){echo $data['id'];} ?>" />
		<table class="table table-bordered table-condensed table-hover">
			<tr>
				<td style="width:70px;font-size:14px;">许可渠道:</td><?php $var = 'channel';?>
				<td><input name="<?=$var?>" value="<?php if($data){echo $data[$var];} ?>" type="text" class="in_t3" />渠道白名单，默认许可，多个渠道之间以英文空格隔开</td>
			</tr>
			<tr>
				<td style="width:70px;font-size:14px;">屏蔽渠道:</td><?php $var = 'channot';?>
				<td><input name="<?=$var?>" value="<?php if($data){echo $data[$var];} ?>" type="text" class="in_t3" />渠道黑名单，优先屏蔽，多个渠道之间以英文空格隔开</td>
			</tr>
			<tr>
				<td style="width:70px;font-size:14px;">图片类型:</td>
				<td>
					<select class="span2" name="path">
						<?php
						foreach ($pathes as $k => $v) {
							$selected = $data&&$data['path']==$k?" selected='selected'":"";
							echo '<option value="'.$k.'"'.$selected.'>'.$v.'</option>';
						}
						?>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:70px;font-size:14px;">图片编号:</td>
				<td><input name="fileid" value="<?php if($data){echo $data['fileid'];} ?>" type="text" class="in_t" />多个编号之间用英文空格隔开</td>
			</tr>
			<tr>
				<td style="width:70px;font-size:14px;">图片上传:</td>
				<td>暂不支持，目前需要手动上传到CDN的目录。
					<br/>商品列表图 mall_goods
					<br/>兑换列表图 mall_exchange
					<br/>充值列表图 mall_recharge
					<br/>背包道具图 mall_prop
					<br/>礼包弹出图 goods_control
					<br/>礼包标题图 goods_controltitle
					<br/>礼包大厅图 goods_controllobby
					<br/>礼包按钮图 goods_controlbutton
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td class="span1"><input type="submit" value="提交" class="btn" /></td>
			</tr>
		</table>
	</form>
</fieldset>

</div>
</body>