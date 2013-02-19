$redis   = Redis.new
$rollout = Rollout.new($redis)


RolloutAdmin.user_name_attribute    = "name"