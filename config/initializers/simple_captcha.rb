SimpleCaptcha.setup do |sc|
  # 初期値: 100x28
  sc.image_size = "128x48"

  # 初期値: 5
  sc.length = 5

  # 初期値: simply_blue
  # possible values:
  # "embosed_silver",
  # "simply_red",
  # "simply_green",
  # "simply_blue",
  # "distorted_black",
  # "all_black",
  # "charcoal_grey",
  # "almost_invisible"
  # "random"
  sc.image_style = "simply_green"

  # 初期値: low ["low", "medium", "high", "random"]
  sc.distortion = "low"

  # 初期値: medium ["none", "low", "medium", "high"]
  sc.implode = "medium"
end
