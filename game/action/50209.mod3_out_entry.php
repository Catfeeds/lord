<?php

//取消参赛

$ud = $user['uid'];
$md = $user['modelId'];
$rd = isset($params['roomId']) ? intval($params['roomId']) : 0;
$td = $user['tableId'];
$sd = $user['seatId'];

$ret = $this->match->untry($rd, $user);
$errno = $this->match->errno;
$error = $this->match->error;
$errors = $this->match->getError();
if ( $errno == 99 ) gerr("[$accode] F=$fd U=$ud R=$rd T=$td ".json_encode($errors));
if ( ! $ret ) {
	$send = array('errno'=>$errno, 'error'=>$errno>99?$error:'', 'coins'=>$user['coins'], 'coupon'=>$user['coupon']);
} else {
	$user = array_merge($user, $ret['newU']); // $room = $ret['room'];
	$send = array('errno'=>$errno, 'error'=>'', 'money'=>$ret['room']['entryMoney'], 'cost'=>$ret['room']['entryCost'], 'coins'=>$user['coins'], 'coupon'=>$user['coupon']);
	$this->record->money('新赛取消', $ret['room']['entryMoney'], $ret['room']['entryCost'], $ud, $user);
}
debug("用户取消参赛 F=$fd U=$ud R=$rd T=$td");
$cmd = 5; $code = 210;
sendToFd($fd, $cmd, $code, $send);


//报名操作后 主动刷新房间
$room = $this->match->showRoom($rd, $user);
$errno = $this->match->errno;
$errors = $this->match->getError();
if ( $errno == 99 ) gerr("[$accode] F=$fd U=$ud R=$rd T=$td ".json_encode($errors));
if ( ! $room ) $room = array('brief'=>'', 'state'=>0);
$view = array('brief'=>$room['brief'], 'state'=>$room['state']);
$cmd = 5; $code = 206; $send = array('errno'=>$errno,'error'=>''); $send = array_merge($send, $view);
sendToFd($fd, $cmd, $code, $send);


end:{
	// $rd = $user['lastRoomId'];
	// $this->model->record->action($accode, $rd, $td, $ud, $user);
}
