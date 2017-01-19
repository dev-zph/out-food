$(function(){
  var bClassify = false,
      bClassifyBig = false,
      bClassifyBigSub = false,
      oMenuList = $('.menu-list'),
      oMenuListH2 = oMenuList.find('h2'),
      oClassifyBox = $('.classify-box'),
      oClassifyBig = $('.classify-big'),
      oClassifyBigLi = oClassifyBig.find('li'),
      oClassifySub = $('.classify-sub');
      aClassifySubBox = $('.classify-sub-box');
  $('.sidebar-title').bind('click',function(){
    var _this = $(this),
        oL = _this.find('i'),
        oUl = _this.next();
      if( oL.hasClass('on') ){
        oUl.hide();
        oL.removeClass('on').addClass('off');
      }else{
        oUl.show();
        oL.removeClass('off').addClass('on');
      }
  });

  if( !$('.banner').get(0) ){
    oMenuListH2.hover(function(){
        $(this).addClass('active');
        oClassifyBox.show();
        bClassify = true;
    },function(){
        if( !bClassify ){
          oClassifyBox.hide();
          oMenuListH2.removeClass('active');
        }
    });

    oClassifyBox.hover(function(){
    },function(){
      if( !bClassifyBig ){
        oClassifyBox.hide();
        oMenuListH2.removeClass('active');
      }
    });

    oClassifyBigLi.hover(function(){
      var _this = $(this),
          index = _this.index();
      bClassifyBigSub = true;
      oClassifySub.show();
      oClassifyBigLi.removeClass('hover');
      _this.addClass('hover');
      aClassifySubBox.hide();
      $( aClassifySubBox.eq( index ) ).show();
      setDlTextHeight( aClassifySubBox.eq( index ) );
    },function(){
      if( !bClassifyBigSub ){
        $(this).removeClass('hover');
      }
    })

    aClassifySubBox.mouseleave(function(){
        bClassifyBigSub = false;
    });
  }else{
    oMenuListH2.addClass('active');
    oClassifyBigLi.hover(function(){
      var _this = $(this),
          index = _this.index();
      bClassifyBigSub = true;
      oClassifySub.show();
      oClassifyBigLi.removeClass('hover');
      _this.addClass('hover');
      aClassifySubBox.hide();
      $( aClassifySubBox.eq( index ) ).show();
      setDlTextHeight( aClassifySubBox.eq( index ) );
    },function(){
      if( !bClassifyBigSub ){
        $(this).removeClass('hover');
        oClassifySub.hide();
      }
      bClassifyBigSub = false;
    });

    oClassifyBox.hover(function(){
      bClassifyBigSub = true;
    },function(){
      oClassifyBigLi.removeClass('hover');
      oClassifySub.hide();
    });
  }

  function setDlTextHeight( obj ){
    obj.find('dl').each(function(){
      var _this = $(this),
      height = _this.outerHeight() < 20 ? _this.outerHeight() - 20 : 30,
          oDl = _this.find('dt');
      oDl.css('line-height',height+'px');
    });
  }

    $('.recommend-service dl dd').hover(function(){
        $(this).animate({
          bottom: '22px'
        },100);
    },function(){
        $(this).animate({
          bottom: '20px'
        },100);
    });

    var timer = null;

    function loopBanner( curIndex ){
      clearTimeout( timer );
      var aBanner = $('.menu-box'),
          oImgData = aBanner.attr('data'),
          index = +aBanner.attr('index'),
          oADDisc = $('.ad-disc'),
          aDisc = [];
          thisFn = arguments.callee;

        oImgData = oImgData.split('|');
        if( index < 0 ){
          index = 0;
        }else if( index >= oImgData.length -1 ){
          index = 0;
        }else{
          index++;
        }
        //当前需要显示的图片
        index = curIndex ? curIndex : index;

        if( oImgData.length == 0 ){
          aBanner.css({
            backgroundImage: 'url("temp/big-banner3.jpg")'
          });
          oADDisc.append('<i class="on">');
        }else{
          aBanner.css({
            backgroundImage: 'url('+oImgData[index]+')'
          });
          for( var i = 0; i < oImgData.length; i++ ){
            if( i == index ){
              aDisc.push('<i class="on"></i>');
            }else{
              aDisc.push('<i></i>');
            }
          }
          oADDisc.html( aDisc.join('') );
        }
        aBanner.attr('index',index);
        $('.ad-disc i:not(.on)').on('click',function(){
          var index = $(this).index();
          loopBanner( index );
        });
        timer = setTimeout(function(){
            thisFn();
        },5*1000);
    }

    if( $('.banner').get(0) ){
      loopBanner();
    }else if( $('.stote-banner').get(0) ){
      loopBanner();
    }

    if( $('.menu-box-home').get(0) ){
        var floor = $(".get-floor"),
            floorList = floor.find('li');
        $backToTopFun = function() {
          var a = $(document).scrollTop(), b = $(window).height();
          if (a > 620) {
            floor.add('.goTop').show(100);
          } else {
            floor.add('.goTop').hide()
          }
        };
        
        $('.goTop').click(function(){
          $('html, body').animate({
            scrollTop: 0
          },400);
          this.hide();
        });

        $(window).bind("scroll", $backToTopFun);

        floorList.bind('click',function(){
          var _this = $(this),
              index = _this.index()+1;
            $('html, body').animate({
              scrollTop: $('#floor'+index).position().top
            },400);
        });

        var win = $(window),
            num = 150;
        win.bind('scroll',function(){
            var h = win.scrollTop(),
                menu = floorList;
             menu.removeClass('on').find('span').hide().end().find('em').show();
            if( h > $('#floor1').position().top - num && h < $('#floor2').position().top - num ){
              menu.eq(0).addClass('on').find('em').hide().end().find('span').show();
            }else if( h > $('#floor2').position().top - num && h < $('#floor3').position().top - num ){
              menu.eq(1).addClass('on').find('em').hide().end().find('span').show();
            }else if( h > $('#floor3').position().top - num && h < $('#floor4').position().top - num ){
              menu.eq(2).addClass('on').find('em').hide().end().find('span').show();
            }else if( h > $('#floor4').position().top - num && h < $('#floor5').position().top - num ){
              menu.eq(3).addClass('on').find('em').hide().end().find('span').show();
            }else if( h > $('#floor5').position().top - num && h < $('#floor6').position().top - num ){
              menu.eq(4).addClass('on').find('em').hide().end().find('span').show();
            }else if( h > $('#floor6').position().top - num && h < $('.bottom-info').position().top - num ){
              menu.eq(5).addClass('on').find('em').hide().end().find('span').show();
            }
          });
    }
    $('.help-info .open').bind('click',function(){
        var _this = $(this),
            oTr = _this.parents('tr').next();
        if( _this.hasClass('close') ){
          oTr.hide();
          _this.removeClass('close');
        }else{
          oTr.show(); 
          _this.addClass('close');
        }
        return false;
      });
    
})