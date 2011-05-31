# 履歴関連の設定
set history save on
set history size 10000
# set history filename ~/.gdb_history

# 表示関連の設定
set print array on
set print pretty on
set print union on
set print object on
set print static-members off
set print vtbl on
# set charset ASCII

define print_vector
  if ($arg1 < 0 || $arg0.size() <= $arg1)
    print "out of range"
  else
    print $arg0._M_impl._M_start[$arg1]
  end
end

