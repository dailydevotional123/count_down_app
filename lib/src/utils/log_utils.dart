import 'package:flutter/material.dart';

dp({msg, arg}) {
  debugPrint("\n\u001b[1;32m $msg    ->  $arg    \n");
}

ep(e, s) {
  debugPrint("\n\u001b[1;32m Error ## $e    ->  $s    \n");
}
