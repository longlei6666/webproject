	var FancyForm = function() {
				return {
					inputs: ".tagsinput",
					setup: function() {
						var a = this;
						this.inputs = $(this.inputs);
						a.inputs.each(function() {
							var c = $(this);
							a.checkVal(c)
						});
						a.inputs.live("keyup blur", function() {
							var c = $(this);
							a.checkVal(c);
						});
					},
					checkVal: function(a) {
						a.val().length > 0 ? a.parent("li").addClass("val") : a.parent("li").removeClass("val")
					}
				}
			}();

			$(document).ready(function() {
				FancyForm.setup();
			});

			var searchAjax = function() {};
			var G_tocard_maxTips = 30;

			$(function() {
				(
					function() {
						var a = $(".myTags");
						$("a i", a).live("click", function() {
							var c = $(this).parents("a"),
								b = c.attr("title"),
								d = c.attr("value");
							delTips(b, d)
						});
						hasTips = function(b) {
							var d = $("a", a),
								c = false;
							d.each(function() {
								if($(this).attr("title") == b) {
									c = true;
									return false
								}
							});
							return c
						};

						isMaxTips = function() {
							return
							$("a", a).length >= G_tocard_maxTips
						};

						setTips = function(c, d) {
							if(hasTips(c)) {
								return false
							}
							if(isMaxTips()) {
								alert("最多添加" + G_tocard_maxTips + "个标签！");
								return false
							}
							var b = c ? 'value="' + c + '"' : "";
							a.append($("<a " + b + ' title="' + c + '" href="javascript:void(0);" ><span>' + c + '</span><i class="layui-icon layui-tab-close"'+'>ဆ</i></a>'));
							searchAjax(c, d, true);
							return true
						};

						delTips = function(b, c) {
							if(!hasTips(b)) {
								return false
							}
							$("a", a).each(function() {
								var d = $(this);
								if(d.attr("title") == b) {
									d.remove();
									return false
								}
							});
							searchAjax(b, c, false);
							return true
						};

						getTips = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("title"))
							});
							return b
						};

						getTipsId = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value"))
							});
							return b
						};

						getTipsIdAndTag = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value") + "##" + $(this).attr("title"))
							});
							return b
						}
					}

				)()
			});

			// 搜索
			(function() {
				var $b = $('.tagsbtn'),
					$i = $('.tagsinput');
				$i.keyup(function(e) {
					if(e.keyCode == 13) {
						$b.click();
					}
				});
				$b.click(function() {
					var name = $i.val().toLowerCase();
					if(name != '') setTips(name, -1);
					$i.val('');
					$i.select();
				});
			})();
			
			
			
			
			
			var FancyForm1 = function() {
				return {
					inputs: ".tagsinput1",
					setup: function() {
						var a = this;
						this.inputs = $(this.inputs);
						a.inputs.each(function() {
							var c = $(this);
							a.checkVal(c)
						});
						a.inputs.live("keyup blur", function() {
							var c = $(this);
							a.checkVal(c);
						});
					},
					checkVal: function(a) {
						a.val().length > 0 ? a.parent("li").addClass("val") : a.parent("li").removeClass("val")
					}
				}
			}();

			$(function() {
				(
					function() {
						var a = $(".myTags1");
						$("a i", a).live("click", function() {
							var c = $(this).parents("a"),
								b = c.attr("title"),
								d = c.attr("value");
							delTips1(b, d)
						});
						hasTips1 = function(b) {
							var d = $("a", a),
								c = false;
							d.each(function() {
								if($(this).attr("title") == b) {
									c = true;
									return false
								}
							});
							return c
						};

						isMaxTips1 = function() {
							return
							$("a", a).length >= G_tocard_maxTips
						};

						setTips1 = function(c, d) {
							if(hasTips1(c)) {
								return false
							}
							if(isMaxTips1()) {
								alert("最多添加" + G_tocard_maxTips + "个标签！");
								return false
							}
							var b = c ? 'value="' + c + '"' : "";
							a.append($("<a " + b + ' title="' + c + '" href="javascript:void(0);" ><span>' + c + '</span><i class="layui-icon layui-tab-close"'+'>ဆ</i></a>'));
							searchAjax(c, d, true);
							return true
						};

						delTips1 = function(b, c) {
							if(!hasTips1(b)) {
								return false
							}
							$("a", a).each(function() {
								var d = $(this);
								if(d.attr("title") == b) {
									d.remove();
									return false
								}
							});
							searchAjax(b, c, false);
							return true
						};

						getTips1 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("title"))
							});
							return b
						};

						getTipsId1 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value"))
							});
							return b
						};

						getTipsIdAndTag1 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value") + "##" + $(this).attr("title"))
							});
							return b
						}
					}

				)()
			});

			// 搜索
			(function() {
				var $b = $('.tagsbtn1'),
					$i = $('.tagsinput1');
				$i.keyup(function(e) {
					if(e.keyCode == 13) {
						$b.click();
					}
				});
				$b.click(function() {
					var name = $i.val().toLowerCase();
					if(name != '') setTips1(name, -1);
					$i.val('');
					$i.select();
				});
			})();
			
			
			
			var FancyForm2 = function() {
				return {
					inputs: ".tagsinput2",
					setup: function() {
						var a = this;
						this.inputs = $(this.inputs);
						a.inputs.each(function() {
							var c = $(this);
							a.checkVal(c)
						});
						a.inputs.live("keyup blur", function() {
							var c = $(this);
							a.checkVal(c);
						});
					},
					checkVal: function(a) {
						a.val().length > 0 ? a.parent("li").addClass("val") : a.parent("li").removeClass("val")
					}
				}
			}();

			$(function() {
				(
					function() {
						var a = $(".myTags2");
						$("a i", a).live("click", function() {
							var c = $(this).parents("a"),
								b = c.attr("title"),
								d = c.attr("value");
							delTips2(b, d)
						});
						hasTips2 = function(b) {
							var d = $("a", a),
								c = false;
							d.each(function() {
								if($(this).attr("title") == b) {
									c = true;
									return false
								}
							});
							return c
						};

						isMaxTips2 = function() {
							return
							$("a", a).length >= G_tocard_maxTips
						};

						setTips2 = function(c, d) {
							if(hasTips2(c)) {
								return false
							}
							if(isMaxTips2()) {
								alert("最多添加" + G_tocard_maxTips + "个标签！");
								return false
							}
							var b = c ? 'value="' + c + '"' : "";
							a.append($("<a " + b + ' title="' + c + '" href="javascript:void(0);" ><span>' + c + '</span><i class="layui-icon layui-tab-close"'+'>ဆ</i></a>'));
							searchAjax(c, d, true);
							return true
						};

						delTips2 = function(b, c) {
							if(!hasTips2(b)) {
								return false
							}
							$("a", a).each(function() {
								var d = $(this);
								if(d.attr("title") == b) {
									d.remove();
									return false
								}
							});
							searchAjax(b, c, false);
							return true
						};

						getTips2 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("title"))
							});
							return b
						};

						getTipsId2 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value"))
							});
							return b
						};

						getTipsIdAndTag2 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value") + "##" + $(this).attr("title"))
							});
							return b
						}
					}

				)()
			});

			// 搜索
			(function() {
				var $b = $('.tagsbtn2'),
					$i = $('.tagsinput2');
				$i.keyup(function(e) {
					if(e.keyCode == 13) {
						$b.click();
					}
				});
				$b.click(function() {
					var name = $i.val().toLowerCase();
					if(name != '') setTips2(name, -1);
					$i.val('');
					$i.select();
				});
			})();
			
			
			
			
			var FancyForm3 = function() {
				return {
					inputs: ".tagsinput3",
					setup: function() {
						var a = this;
						this.inputs = $(this.inputs);
						a.inputs.each(function() {
							var c = $(this);
							a.checkVal(c)
						});
						a.inputs.live("keyup blur", function() {
							var c = $(this);
							a.checkVal(c);
						});
					},
					checkVal: function(a) {
						a.val().length > 0 ? a.parent("li").addClass("val") : a.parent("li").removeClass("val")
					}
				}
			}();

			$(function() {
				(
					function() {
						var a = $(".myTags3");
						$("a i", a).live("click", function() {
							var c = $(this).parents("a"),
								b = c.attr("title"),
								d = c.attr("value");
							delTips3(b, d)
						});
						hasTips3 = function(b) {
							var d = $("a", a),
								c = false;
							d.each(function() {
								if($(this).attr("title") == b) {
									c = true;
									return false
								}
							});
							return c
						};

						isMaxTips3 = function() {
							return
							$("a", a).length >= G_tocard_maxTips
						};

						setTips3 = function(c, d) {
							if(hasTips3(c)) {
								return false
							}
							if(isMaxTips3()) {
								alert("最多添加" + G_tocard_maxTips + "个标签！");
								return false
							}
							var b = c ? 'value="' + c + '"' : "";
							a.append($("<a " + b + ' title="' + c + '" href="javascript:void(0);" ><span>' + c + '</span><i class="layui-icon layui-tab-close"'+'>ဆ</i></a>'));
							searchAjax(c, d, true);
							return true
						};

						delTips3 = function(b, c) {
							if(!hasTips3(b)) {
								return false
							}
							$("a", a).each(function() {
								var d = $(this);
								if(d.attr("title") == b) {
									d.remove();
									return false
								}
							});
							searchAjax(b, c, false);
							return true
						};

						getTips3 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("title"))
							});
							return b
						};

						getTipsId3 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value"))
							});
							return b
						};

						getTipsIdAndTag3 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value") + "##" + $(this).attr("title"))
							});
							return b
						}
					}

				)()
			});

			// 搜索
			(function() {
				var $b = $('.tagsbtn3'),
					$i = $('.tagsinput3');
				$i.keyup(function(e) {
					if(e.keyCode == 13) {
						$b.click();
					}
				});
				$b.click(function() {
					var name = $i.val().toLowerCase();
					if(name != '') setTips3(name, -1);
					$i.val('');
					$i.select();
				});
			})();
			
			
			
			
			var FancyForm4 = function() {
				return {
					inputs: ".tagsinput4",
					setup: function() {
						var a = this;
						this.inputs = $(this.inputs);
						a.inputs.each(function() {
							var c = $(this);
							a.checkVal(c)
						});
						a.inputs.live("keyup blur", function() {
							var c = $(this);
							a.checkVal(c);
						});
					},
					checkVal: function(a) {
						a.val().length > 0 ? a.parent("li").addClass("val") : a.parent("li").removeClass("val")
					}
				}
			}();

			$(function() {
				(
					function() {
						var a = $(".myTags4");
						$("a i", a).live("click", function() {
							var c = $(this).parents("a"),
								b = c.attr("title"),
								d = c.attr("value");
							delTips4(b, d)
						});
						hasTips4 = function(b) {
							var d = $("a", a),
								c = false;
							d.each(function() {
								if($(this).attr("title") == b) {
									c = true;
									return false
								}
							});
							return c
						};

						isMaxTips4 = function() {
							return
							$("a", a).length >= G_tocard_maxTips
						};

						setTips4 = function(c, d) {
							if(hasTips4(c)) {
								return false
							}
							if(isMaxTips4()) {
								alert("最多添加" + G_tocard_maxTips + "个标签！");
								return false
							}
							var b = c ? 'value="' + c + '"' : "";
							a.append($("<a " + b + ' title="' + c + '" href="javascript:void(0);" ><span>' + c + '</span><i class="layui-icon layui-tab-close"'+'>ဆ</i></a>'));
							searchAjax(c, d, true);
							return true
						};

						delTips4 = function(b, c) {
							if(!hasTips4(b)) {
								return false
							}
							$("a", a).each(function() {
								var d = $(this);
								if(d.attr("title") == b) {
									d.remove();
									return false
								}
							});
							searchAjax(b, c, false);
							return true
						};

						getTips4 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("title"))
							});
							return b
						};

						getTipsId4 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value"))
							});
							return b
						};

						getTipsIdAndTag4 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value") + "##" + $(this).attr("title"))
							});
							return b
						}
					}

				)()
			});

			// 搜索
			(function() {
				var $b = $('.tagsbtn4'),
					$i = $('.tagsinput4');
				$i.keyup(function(e) {
					if(e.keyCode == 13) {
						$b.click();
					}
				});
				$b.click(function() {
					var name = $i.val().toLowerCase();
					if(name != '') setTips4(name, -1);
					$i.val('');
					$i.select();
				});
			})();
			
			
			
			
			var FancyForm5 = function() {
				return {
					inputs: ".tagsinput5",
					setup: function() {
						var a = this;
						this.inputs = $(this.inputs);
						a.inputs.each(function() {
							var c = $(this);
							a.checkVal(c)
						});
						a.inputs.live("keyup blur", function() {
							var c = $(this);
							a.checkVal(c);
						});
					},
					checkVal: function(a) {
						a.val().length > 0 ? a.parent("li").addClass("val") : a.parent("li").removeClass("val")
					}
				}
			}();

			$(function() {
				(
					function() {
						var a = $(".myTags5");
						$("a i", a).live("click", function() {
							var c = $(this).parents("a"),
								b = c.attr("title"),
								d = c.attr("value");
							delTips5(b, d)
						});
						hasTips5 = function(b) {
							var d = $("a", a),
								c = false;
							d.each(function() {
								if($(this).attr("title") == b) {
									c = true;
									return false
								}
							});
							return c
						};

						isMaxTips5 = function() {
							return
							$("a", a).length >= G_tocard_maxTips
						};

						setTips5 = function(c, d) {
							if(hasTips5(c)) {
								return false
							}
							if(isMaxTips5()) {
								alert("最多添加" + G_tocard_maxTips + "个标签！");
								return false
							}
							var b = c ? 'value="' + c + '"' : "";
							a.append($("<a " + b + ' title="' + c + '" href="javascript:void(0);" ><span>' + c + '</span><i class="layui-icon layui-tab-close"'+'>ဆ</i></a>'));
							searchAjax(c, d, true);
							return true
						};

						delTips5 = function(b, c) {
							if(!hasTips5(b)) {
								return false
							}
							$("a", a).each(function() {
								var d = $(this);
								if(d.attr("title") == b) {
									d.remove();
									return false
								}
							});
							searchAjax(b, c, false);
							return true
						};

						getTips5 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("title"))
							});
							return b
						};

						getTipsId5 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value"))
							});
							return b
						};

						getTipsIdAndTag5 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value") + "##" + $(this).attr("title"))
							});
							return b
						}
					}

				)()
			});

			// 搜索
			(function() {
				var $b = $('.tagsbtn5'),
					$i = $('.tagsinput5');
				$i.keyup(function(e) {
					if(e.keyCode == 13) {
						$b.click();
					}
				});
				$b.click(function() {
					var name = $i.val().toLowerCase();
					if(name != '') setTips5(name, -1);
					$i.val('');
					$i.select();
				});
			})();
			
			
			
			
			var FancyForm6 = function() {
				return {
					inputs: ".tagsinput6",
					setup: function() {
						var a = this;
						this.inputs = $(this.inputs);
						a.inputs.each(function() {
							var c = $(this);
							a.checkVal(c)
						});
						a.inputs.live("keyup blur", function() {
							var c = $(this);
							a.checkVal(c);
						});
					},
					checkVal: function(a) {
						a.val().length > 0 ? a.parent("li").addClass("val") : a.parent("li").removeClass("val")
					}
				}
			}();

			$(function() {
				(
					function() {
						var a = $(".myTags6");
						$("a i", a).live("click", function() {
							var c = $(this).parents("a"),
								b = c.attr("title"),
								d = c.attr("value");
							delTips6(b, d)
						});
						hasTips6 = function(b) {
							var d = $("a", a),
								c = false;
							d.each(function() {
								if($(this).attr("title") == b) {
									c = true;
									return false
								}
							});
							return c
						};

						isMaxTips6 = function() {
							return
							$("a", a).length >= G_tocard_maxTips
						};

						setTips6 = function(c, d) {
							if(hasTips6(c)) {
								return false
							}
							if(isMaxTips6()) {
								alert("最多添加" + G_tocard_maxTips + "个标签！");
								return false
							}
							var b = c ? 'value="' + c + '"' : "";
							a.append($("<a " + b + ' title="' + c + '" href="javascript:void(0);" ><span>' + c + '</span><i class="layui-icon layui-tab-close"'+'>ဆ</i></a>'));
							searchAjax(c, d, true);
							return true
						};

						delTips6 = function(b, c) {
							if(!hasTips6(b)) {
								return false
							}
							$("a", a).each(function() {
								var d = $(this);
								if(d.attr("title") == b) {
									d.remove();
									return false
								}
							});
							searchAjax(b, c, false);
							return true
						};

						getTips6 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("title"))
							});
							return b
						};

						getTipsId6 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value"))
							});
							return b
						};

						getTipsIdAndTag6 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value") + "##" + $(this).attr("title"))
							});
							return b
						}
					}

				)()
			});

			// 搜索
			(function() {
				var $b = $('.tagsbtn6'),
					$i = $('.tagsinput6');
				$i.keyup(function(e) {
					if(e.keyCode == 13) {
						$b.click();
					}
				});
				$b.click(function() {
					var name = $i.val().toLowerCase();
					if(name != '') setTips6(name, -1);
					$i.val('');
					$i.select();
				});
			})();
			
			
			
			
			var FancyForm7 = function() {
				return {
					inputs: ".tagsinput7",
					setup: function() {
						var a = this;
						this.inputs = $(this.inputs);
						a.inputs.each(function() {
							var c = $(this);
							a.checkVal(c)
						});
						a.inputs.live("keyup blur", function() {
							var c = $(this);
							a.checkVal(c);
						});
					},
					checkVal: function(a) {
						a.val().length > 0 ? a.parent("li").addClass("val") : a.parent("li").removeClass("val")
					}
				}
			}();

			$(function() {
				(
					function() {
						var a = $(".myTags7");
						$("a i", a).live("click", function() {
							var c = $(this).parents("a"),
								b = c.attr("title"),
								d = c.attr("value");
							delTips7(b, d)
						});
						hasTips7 = function(b) {
							var d = $("a", a),
								c = false;
							d.each(function() {
								if($(this).attr("title") == b) {
									c = true;
									return false
								}
							});
							return c
						};

						isMaxTips7 = function() {
							return
							$("a", a).length >= G_tocard_maxTips
						};

						setTips7 = function(c, d) {
							if(hasTips7(c)) {
								return false
							}
							if(isMaxTips7()) {
								alert("最多添加" + G_tocard_maxTips + "个标签！");
								return false
							}
							var b = c ? 'value="' + c + '"' : "";
							a.append($("<a " + b + ' title="' + c + '" href="javascript:void(0);" ><span>' + c + '</span><i class="layui-icon layui-tab-close"'+'>ဆ</i></a>'));
							searchAjax(c, d, true);
							return true
						};

						delTips7 = function(b, c) {
							if(!hasTips7(b)) {
								return false
							}
							$("a", a).each(function() {
								var d = $(this);
								if(d.attr("title") == b) {
									d.remove();
									return false
								}
							});
							searchAjax(b, c, false);
							return true
						};

						getTips7 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("title"))
							});
							return b
						};

						getTipsId7 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value"))
							});
							return b
						};

						getTipsIdAndTag7 = function() {
							var b = [];
							$("a", a).each(function() {
								b.push($(this).attr("value") + "##" + $(this).attr("title"))
							});
							return b
						}
					}

				)()
			});

			// 搜索
			(function() {
				var $b = $('.tagsbtn7'),
					$i = $('.tagsinput7');
				$i.keyup(function(e) {
					if(e.keyCode == 13) {
						$b.click();
					}
				});
				$b.click(function() {
					var name = $i.val().toLowerCase();
					if(name != '') setTips7(name, -1);
					$i.val('');
					$i.select();
				});
			})();