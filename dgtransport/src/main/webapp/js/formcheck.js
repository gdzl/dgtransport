
			$('#epAddForm').formValidation({
	        	framework: 'bootstrap',
	            excluded: ':disabled',
	            fields: {
	            	epNo: {//业户名称
	                    validators: {
	                        notEmpty: {
	                            message: '请输入业户编号'
	                        },
	                        regexp: {
	                            regexp: /^[0-9]+$/,
	                            message: '请输入正确的业户编号'
	                        },
	                        stringLength: {
	                            max: 100,
	                            message: '业户编号字数不能大于100'
	                        } 
	                    }
	                },
	            	epName: {//业户名称
	                    validators: {
	                        notEmpty: {
	                            message: '请输入业户名称'
	                        },
	                        regexp: {
	                            regexp: /^[(\u4E00-\u9FA5A-Za-z0-9\（\）)]+$/,
	                            message: '请输入正确的业户名称'
	                        },
	                        stringLength: {
	                            max: 100,
	                            message: '业户名称字数不能大于100'
	                        } 
	                    }
	                },
	                address: {//经营地址
	                    validators: {
	                        notEmpty: {
	                            message: '请输入经营地址'
	                        },
	                        regexp: {
	                            regexp: /^[(\u4E00-\u9FA5A-Za-z0-9\、\（\）\：)]+$/,
	                            message: '请输入正确的经营地址'
	                        },
	                        stringLength: {
	                            max: 500,
	                            message: '经营地址字数不能大于500'
	                        } 
	                    }
	                },
	                scopeName: {
	                    validators: {
	                        notEmpty: {
	                            message: '请输入经营范围'
	                        },
	                        regexp: {
	                            regexp: /^[(\u4e00-\u9fa5A-Za-z0-9\（\）\、\[\]\：\；\，\。 )]*$/,
	                            message: '请输入正确的经营范围'
	                        },
	                        stringLength: {
	                            max: 500,
	                            message: '经营范围字数不能大于500'
	                        } 
	                    }
	                },
	                tpLicence: {//经营许可证
	                    validators: {
	                        notEmpty: {
	                            message: '请输入经营许可证'
	                        },
	                         regexp: {
	                            regexp:/^[\u4E00-\u9FA5A-Za-z0-9]+$/,
	                            message: '请输入正确的经营许可证'
	                        },
	                        stringLength: {
	                            max: 500,
	                            message: '经营许可证字数不能大于500'
	                        } 
	                    }
	                },
	                icLicence: {//工商执照
	                    validators: {
	                        notEmpty: {
	                            message: '请输入工商执照'
	                        },
	                        regexp: {
	                            regexp:/^[0-9a-zA-Z]*$/,
	                            message: '请输入正确的工商执照'
	                        },
	                        stringLength: {
	                            max: 100,
	                            message: '工商执照字数不能大于100'
	                        } 
	                    }
	                },
	                corporation: {//法定代表人
	                    validators: {
	                        notEmpty: {
	                            message: '请输入法定代表人名称'
	                        },
	                        regexp: {
	                            regexp: /^[(\u4E00-\u9FA5A-Za-z )]+$/,
	                            message: '请输入中文名'
	                        },
	                        stringLength: {
	                            max: 100,
	                            message: '法定代表人字数不能大于100'
	                        } 
	                    }
	                },
	                corcontact:{
	                    validators: {
	                        notEmpty: {
	                            message: '请输入法定联系人联系方式,仅限数字'
	                        },
	                        regexp: {
	                            regexp:/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/,
	                            message: '请输入正确的联系号码'
	                        },
	                        stringLength: {
	                            max: 11,
	                            message: '联系方式字数不能大于11'
	                        } 
	                    }
	                },
	                businessor: {//联系人姓名
	                    validators: {
	                        notEmpty: {
	                            message: '请输入联系人名称'
	                        },
	                        regexp: {
	                            regexp: /^[(\u4E00-\u9FA5A-Za-z )]+$/,
	                            message: '请输入联系人名称'
	                        },
	                        stringLength: {
	                            max: 100,
	                            message: '联系人名称字数不能大于100'
	                        } 
	                    }
	                },
	                contact:{
	                    validators: {
	                        notEmpty: {
	                            message: '请输入业务联系人联系方式,仅限数字'
	                        },
	                        regexp: {
	                            regexp:/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/,
	                            message: '请输入正确的联系号码'
	                        },
	                        stringLength: {
	                            max: 11,
	                            message: '联系方式字数不能大于11'
	                        } 
	                    }
	                }
	            }
	        });
	       
	        
			$('#carAddForm').formValidation({
				framework: 'bootstrap',
	            excluded: ':disabled',
	            fields: {
	                carNo: {
	                    validators: {
	                        notEmpty: {
	                            message: '请输入车牌号'
	                        },
	                        regexp: {
	                            regexp: /(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]{4,23}/,
	                            message: '请输入正确的车牌号'
	                        },
	                        stringLength: {
	                            max: 10,
	                            message: '车牌号字数不能大于10'
	                        }
	                    }
	                },
	                transportNo: {//道路运输证号
	                    validators: {
	                        notEmpty: {
	                            message: '请输入道路运输证号'
	                        },
	                        regexp: {
	                            regexp: /^[\u4E00-\u9FA5A-Za-z0-9]+$/,
	                            message: '请输入正确的道路运输证号'
	                        },
	                        stringLength: {
	                            max: 50,
	                            message: '道路运输证号字数不能大于50'
	                        }
	                    }
	                },
	                scopeName: {//经营范围
	                    validators: {
	                        notEmpty: {
	                            message: '请输入经营范围'
	                        },
	                        regexp: {
	                            regexp: /^[(\u4e00-\u9fa5A-Za-z0-9\（\）\、\[\]\：\；\，\。 )]*$/,
	                            message: '请输入正确的经营范围'
	                        },
	                        stringLength: {
	                            max: 500,
	                            message: '经营范围字数不能大于500'
	                        }
	                    }
	                },
	                carTypeName: {//车辆类别
	                    validators: {
	                        notEmpty: {
	                            message: '请输入车辆类别'
	                        },
	                        regexp: {
	                            regexp: /^[\u4E00-\u9FA5A-Za-z0-9\、]+$/,
	                            message: '请输入正确的车辆类别'
	                        },
	                        stringLength: {
	                            max: 100,
	                            message: '车辆类别字数不能大于100'
	                        }
	                    }
	                },
	                brandNo: {//品牌型号
	                    validators: {
	                        notEmpty: {
	                            message: '请输入品牌型号'
	                        },
	                        regexp: {
	                            regexp: /^[\u4E00-\u9FA5A-Za-z0-9]+$/,
	                            message: '请输入正确的品牌型号'
	                        },
	                        stringLength: {
	                            max: 20,
	                            message: '品牌型号字数不能大于20'
	                        }
	                    }
	                },
	                vin: {//车架号
	                    validators: {
	                        notEmpty: {
	                            message: '请输入车架号'
	                        },
	                        regexp: {
	                            regexp: /^[0-9a-zA-Z]*$/,
	                            message: '请输入正确的车架号'
	                        },
	                        stringLength: {
	                            max: 50,
	                            message: '车架号字数不能大于50'
	                        }
	                    }
	                },
	                engineNo: {//发动机号
	                    validators: {
	                        notEmpty: {
	                            message: '请输入发动机号'
	                        },
	                        regexp: {
	                            regexp: /^[0-9a-zA-Z]*$/,
	                            message: '请输入正确的发动机号'
	                        },
	                        stringLength: {
	                            max: 50,
	                            message: '发动机号字数不能大于50'
	                        }
	                    }
	                },
	                engineStyle: {//发动机型号
	                    validators: {
	                        notEmpty: {
	                            message: '请输入发动机型号'
	                        },
	                        regexp: {
	                            regexp: /^[0-9a-zA-Z-\.\_]*$/,
	                            message: '请输入正确的发动机型号'
	                        },
	                        stringLength: {
	                            max: 50,
	                            message: '发动机型号字数不能大于50'
	                        }
	                    }
	                },
	            }
	        });
			$('#empAddForm').formValidation({
				framework: 'bootstrap',
	            excluded: ':disabled',
		        fields: {
		            name: {
		                validators: {
		                	notEmpty: {
		                        message: '请输入姓名'
		                    },
		                    regexp: {
		                        regexp: /^[(\u4E00-\u9FA5A-Za-z )]+$/,
		                        message: '请输入姓名'
		                    },
		                    stringLength: {
		                        max: 100,
		                        message: '姓名字数不能大于100'
		                    }
		                }
		            },
		            identityNo: {//身份证号
		                validators: {
		                    notEmpty: {
		                        message: '请输入身份证号'
		                    },
		                    regexp: {
		                        regexp: /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/,
		                        message: '请输入正确的身份证号'
		                    },
		                    stringLength: {
		                        max: 18,
		                        message: '身份证号字数不能大于18'
		                    }
		                }
		            },
		            phone: {//联系电话
		                validators: {
		                	notEmpty: {
		                        message: '请输入联系方式,仅限数字'
		                    },
		                    regexp: {
		                        regexp:/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/,
		                        message: '请输入正确的联系号码'
		                    },
		                    stringLength: {
		                        max: 11,
		                        message: '联系方式字数不能大于11'
		                    } 
		                }
		            },
		            certificateNo: {//从业资格证
		                validators: {
		                	 notEmpty: {
		                         message: '请输入从业资格证'
		                     },
		                     regexp: {
		                         regexp: /^[0-9a-zA-Z]*$/,
		                         message: '请输入正确的从业资格证'
		                     },
		                    stringLength: {
		                        max: 100,
		                        message: '从业资格证字数不能大于100'
		                    }
		                }
		            },
		            empTypeName: {//从业资格类别
		                validators: {
		                	notEmpty: {
		                        message: '请输入从业资格类别'
		                    },
		                    regexp: {
		                        regexp: /^[(\u4e00-\u9fa5\（\）\、)]*$/,
		                        message: '请输入中文'
		                    },
		                    stringLength: {
		                        max: 200,
		                        message: '从业资格类别字数不能大于200'
		                    }
		                }
		            },
		            carTypeName: {//准驾车型
		                validators: {
		                	notEmpty: {
		                        message: '请输入准驾车型'
		                    },
		                    regexp: {
		                        regexp:/^[\u4E00-\u9FA5A-Za-z0-9\、]+$/,
		                        message: '请输入正确的准驾车型'
		                    },
		                    stringLength: {
		                        max: 200,
		                        message: '准驾车型字数不能大于200'
		                    }
		                }
		            },
		        }
		    });
			$('#enChangeForm').formValidation({
				framework: 'bootstrap',
	            excluded: ':disabled',
	            fields: {
	            	epName: {//业户名称
	                    validators: {
	                        notEmpty: {
	                            message: '请输入业户名称'
	                        },
	                        regexp: {
	                            regexp:/^[(\u4E00-\u9FA5A-Za-z0-9\（\）)]+$/,
	                            message: '请输入正确的业户名称'
	                        },
	                        stringLength: {
	                            max: 100,
	                            message: '业户名称字数不能大于100'
	                        } 
	                    }
	                },
	                address: {//经营地址
	                    validators: {
	                        notEmpty: {
	                            message: '请输入经营地址'
	                        },
	                        regexp: {
	                            regexp: /^[(\u4E00-\u9FA5A-Za-z0-9\、\（\）\：)]+$/,
	                            message: '请输入正确的经营地址'
	                        },
	                        stringLength: {
	                            max: 500,
	                            message: '经营地址字数不能大于500'
	                        } 
	                    }
	                },
	                scopeName: {
	                    validators: {
	                        notEmpty: {
	                            message: '请输入经营范围'
	                        },
	                        regexp: {
	                            regexp: /^[(\u4e00-\u9fa5A-Za-z0-9\（\）\、\[\]\：\；\，\。 )]*$/,
	                            message: '请输入正确的经营范围'
	                        },
	                        stringLength: {
	                            max: 500,
	                            message: '经营范围字数不能大于500'
	                        } 
	                    }
	                },
	                tpLicence: {//经营许可证
	                    validators: {
	                        notEmpty: {
	                            message: '请输入经营许可证'
	                        },
	                         regexp: {
	                            regexp:/^[\u4E00-\u9FA5A-Za-z0-9]+$/,
	                            message: '请输入正确的经营许可证'
	                        },
	                        stringLength: {
	                            max: 100,
	                            message: '经营许可证字数不能大于100'
	                        } 
	                    }
	                },
	                icLicence: {//工商执照
	                    validators: {
	                        notEmpty: {
	                            message: '请输入工商执照,仅限数字'
	                        },
	                        regexp: {
	                            regexp:/^[0-9a-zA-Z]*$/,
	                            message: '请输入正确的工商执照'
	                        },
	                        stringLength: {
	                            max: 100,
	                            message: '工商执照字数不能大于100'
	                        } 
	                    }
	                },
	                corporation: {//法定代表人
	                    validators: {
	                        notEmpty: {
	                            message: '请输入法定代表人名称'
	                        },
	                        regexp: {
	                            regexp: /^[(\u4E00-\u9FA5A-Za-z )]+$/,
	                            message: '请输入中文名'
	                        },
	                        stringLength: {
	                            max: 100,
	                            message: '法定代表人字数不能大于100'
	                        } 
	                    }
	                },
	                corcontact:{
	                    validators: {
	                        notEmpty: {
	                            message: '请输入法定联系人联系方式,仅限数字'
	                        },
	                        regexp: {
	                            regexp:/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/,
	                            message: '请输入正确的联系号码'
	                        },
	                        stringLength: {
	                            max: 11,
	                            message: '联系方式字数不能大于11'
	                        } 
	                    }
	                },
	                businessor: {//联系人姓名
	                    validators: {
	                        notEmpty: {
	                            message: '请输入联系人名称'
	                        },
	                        regexp: {
	                            regexp: /^[(\u4E00-\u9FA5A-Za-z )]+$/,
	                            message: '请输入联系人名称'
	                        },
	                        stringLength: {
	                            max: 100,
	                            message: '联系人名称字数不能大于100'
	                        } 
	                    }
	                },
	                contact:{
	                    validators: {
	                        notEmpty: {
	                            message: '请输入业务联系人联系方式,仅限数字'
	                        },
	                        regexp: {
	                            regexp:/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/,
	                            message: '请输入正确的联系号码'
	                        },
	                        stringLength: {
	                            max: 11,
	                            message: '联系方式字数不能大于11'
	                        } 
	                    }
	                }
	            }
	        });
			$('#carChangeForm').formValidation({
				framework: 'bootstrap',
	            excluded: ':disabled',
	            fields: {
	                carNo: {
	                    validators: {
	                        notEmpty: {
	                            message: '请输入车牌号'
	                        },
	                        regexp: {
	                            regexp: /(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]{4,23}/,
	                            message: '请输入正确的车牌号'
	                        },
	                        stringLength: {
	                            max: 10,
	                            message: '车牌号字数不能大于10'
	                        }
	                    }
	                },
	                transportNo: {//道路运输证号
	                    validators: {
	                        notEmpty: {
	                            message: '请输入道路运输证号'
	                        },
	                        regexp: {
	                            regexp: /^[\u4E00-\u9FA5A-Za-z0-9]+$/,
	                            message: '请输入正确的道路运输证号'
	                        },
	                        stringLength: {
	                            max: 50,
	                            message: '道路运输证号字数不能大于50'
	                        }
	                    }
	                },
	                scopeName: {//经营范围
	                    validators: {
	                        notEmpty: {
	                            message: '请输入经营范围'
	                        },
	                        regexp: {
	                            regexp: /^[(\u4e00-\u9fa5A-Za-z0-9\（\）\、\[\]\：\；\，\。 )]*$/,
	                            message: '请输入正确的经营范围'
	                        },
	                        stringLength: {
	                            max: 500,
	                            message: '经营范围字数不能大于500'
	                        }
	                    }
	                },
	                carTypeName: {//车辆类别
	                    validators: {
	                        notEmpty: {
	                            message: '请输入车辆类别'
	                        },
	                        regexp: {
	                            regexp: /^[\u4E00-\u9FA5A-Za-z0-9\、]+$/,
	                            message: '请输入正确的车辆类别'
	                        },
	                        stringLength: {
	                            max: 100,
	                            message: '车辆类别字数不能大于100'
	                        }
	                    }
	                },
	                brandNo: {//品牌型号
	                    validators: {
	                        notEmpty: {
	                            message: '请输入品牌型号'
	                        },
	                        regexp: {
	                            regexp: /^[\u4E00-\u9FA5A-Za-z0-9]+$/,
	                            message: '请输入正确的品牌型号'
	                        },
	                        stringLength: {
	                            max: 20,
	                            message: '品牌型号字数不能大于20'
	                        }
	                    }
	                },
	                vin: {//车架号
	                    validators: {
	                        notEmpty: {
	                            message: '请输入车架号'
	                        },
	                        regexp: {
	                            regexp: /^[0-9a-zA-Z]*$/,
	                            message: '请输入正确的车架号'
	                        },
	                        stringLength: {
	                            max: 50,
	                            message: '车架号字数不能大于50'
	                        }
	                    }
	                },
	                engineNo: {//发动机号
	                    validators: {
	                        notEmpty: {
	                            message: '请输入发动机号'
	                        },
	                        regexp: {
	                            regexp: /^[0-9a-zA-Z]*$/,
	                            message: '请输入正确的发动机号'
	                        },
	                        stringLength: {
	                            max: 50,
	                            message: '发动机号字数不能大于50'
	                        }
	                    }
	                },
	                engineStyle: {//发动机型号
	                    validators: {
	                        notEmpty: {
	                            message: '请输入发动机型号'
	                        },
	                        regexp: {
	                            regexp: /^[0-9a-zA-Z-\.\_]*$/,
	                            message: '请输入正确的发动机型号'
	                        },
	                        stringLength: {
	                            max: 50,
	                            message: '发动机型号字数不能大于50'
	                        }
	                    }
	                },
	            }
	        });
			$('#empChangeForm').formValidation({//人员修改
				framework: 'bootstrap',
	            excluded: ':disabled',
		        fields: {
		            name: {
		                validators: {
		                	notEmpty: {
		                        message: '请输入姓名'
		                    },
		                    regexp: {
		                        regexp: /^[(\u4E00-\u9FA5A-Za-z )]+$/,
		                        message: '请输入姓名'
		                    },
		                    stringLength: {
		                        max: 100,
		                        message: '姓名字数不能大于100'
		                    }
		                }
		            },
		            identityNo: {//身份证号
		                validators: {
		                    notEmpty: {
		                        message: '请输入身份证号'
		                    },
		                    regexp: {
		                        regexp: /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/,
		                        message: '请输入正确的身份证号'
		                    },
		                    stringLength: {
		                        max: 18,
		                        message: '身份证号字数不能大于18'
		                    }
		                }
		            },
		            phone: {//联系电话
		                validators: {
		                	notEmpty: {
		                        message: '请输入联系方式,仅限数字'
		                    },
		                    regexp: {
		                        regexp:/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/,
		                        message: '请输入正确的联系号码'
		                    },
		                    stringLength: {
		                        max: 11,
		                        message: '联系方式字数不能大于11'
		                    } 
		                }
		            },
		            certificateNo: {//从业资格证
		                validators: {
		                	 notEmpty: {
		                         message: '请输入从业资格证'
		                     },
		                     regexp: {
		                         regexp: /^[0-9a-zA-Z]*$/,
		                         message: '请输入正确的从业资格证'
		                     },
		                    stringLength: {
		                        max: 100,
		                        message: '从业资格证字数不能大于100'
		                    }
		                }
		            },
		            empTypeName: {//从业资格类别
		                validators: {
		                	notEmpty: {
		                        message: '请输入从业资格类别'
		                    },
		                    regexp: {
		                        regexp: /^[(\u4e00-\u9fa5\（\）\、)]*$/,
		                        message: '请输入中文'
		                    },
		                    stringLength: {
		                        max: 200,
		                        message: '从业资格类别字数不能大于200'
		                    }
		                }
		            },
		            carTypeName: {//准驾车型
		                validators: {
		                	notEmpty: {
		                        message: '请输入准驾车型'
		                    },
		                    regexp: {
		                        regexp: /^[\u4E00-\u9FA5A-Za-z0-9\、]+$/,
		                        message: '请输入正确的准驾车型'
		                    },
		                    stringLength: {
		                        max: 200,
		                        message: '准驾车型字数不能大于200'
		                    }
		                }
		            },
		        }
		    });

        