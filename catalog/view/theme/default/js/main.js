document.addEventListener("DOMContentLoaded", function(){

	var icons = document.getElementsByClassName('top-social')[0];
	var icons2 = document.getElementById('footer-social');
	var iconsImg1 = icons.getElementsByTagName('img');
	var iconsImg2 = icons2.getElementsByTagName('img');

	iconsImg1 = Array.prototype.slice.call(iconsImg1);
	iconsImg2 = Array.prototype.slice.call(iconsImg2);
	// iconsAdvImg = Array.prototype.slice.call(iconsAdvImg);
	var iconsImg = iconsImg1.concat( iconsImg2);
	for(i=0; i<iconsImg.length; i++){
		iconsImg[i].parentNode.addEventListener('mouseover', function(){
			var itemImg = this.getElementsByTagName('img')[0];
			var oldSrc = itemImg.src.substring(0, itemImg.src.length - 5);
			itemImg.src = oldSrc + "w.png";
		});
		iconsImg[i].parentNode.addEventListener('mouseout', function(){
			var itemImg = this.getElementsByTagName('img')[0];
			var oldSrc = itemImg.src.substring(0, itemImg.src.length - 5);
			itemImg.src = oldSrc + "g.png";
		});
	}

	var iconsAdv = document.getElementsByClassName('advantages')[0];
	if(iconsAdv){
		var iconsAdvImg = iconsAdv.getElementsByTagName('img');
		for(i=0; i<iconsAdvImg.length; i++){
			iconsAdvImg[i].parentNode.addEventListener('mouseover', function(){
				var itemImg = this.getElementsByTagName('img')[0];
				var oldSrc = itemImg.src.substring(0, itemImg.src.length - 5);
				itemImg.src = oldSrc + "w.png";
			});
			iconsAdvImg[i].parentNode.addEventListener('mouseout', function(){
				var itemImg = this.getElementsByTagName('img')[0];
				var oldSrc = itemImg.src.substring(0, itemImg.src.length - 5);
				itemImg.src = oldSrc + "g.png";
			});
		}
	}
	

	var iconsCartImg = document.getElementsByClassName('cart-icons-img');
	for(i=0; i<iconsCartImg.length; i++){
		iconsCartImg[i].addEventListener('mouseover', function(){
			var oldSrc = this.src.substring(0, this.src.length - 5);
			this.src = oldSrc + "b.png";
		});
		iconsCartImg[i].addEventListener('mouseout', function(){
			var oldSrc = this.src.substring(0, this.src.length - 5);
			this.src = oldSrc + "g.png";
		});
	};

// 	var iconsPrem = document.getElementsByClassName('category-menu-premium')[0];
// 	var iconsPremImg = iconsPrem.getElementsByTagName('img');
// 	if(iconsPrem){
// 	console.log(iconsPremImg.length);
// 	for(i=0; i<iconsPremImg.length; i++){
// 		iconsPremImg[i].parentNode.parentNode.addEventListener('mouseover', function(){
// 			var itemImg = this.getElementsByTagName('img')[0];
// 			var oldSrc = itemImg.src.substring(0, itemImg.src.length - 5);
// 			itemImg.src = oldSrc + "w.png";
// 		});
// 		iconsPremImg[i].parentNode.parentNode.addEventListener('mouseout', function(){
// 			var itemImg = this.getElementsByTagName('img')[0];
// 			var oldSrc = itemImg.src.substring(0, itemImg.src.length - 5);
// 			itemImg.src = oldSrc + "g.png";
// 		});
// 	}
// };


var socialBlock = document.getElementById('socialBlock');
var socialFooterBtn = document.getElementById('footer-social-middle');
socialBlock.style.display = "none";

socialFooterBtn.addEventListener('click', function(){
	if(socialBlock.style.display == "none"){
		socialBlock.style.display = "block";
		socialFooterBtn.style.cssText = "background-image:url(/catalog/view/theme/default/images/arrow-social-footer2.png)";

	}
	else{
		socialBlock.style.display = "none";	
		socialFooterBtn.style.cssText = "background-image:url(/catalog/view/theme/default/images/arrow-social-footer1.png)";
	}
});


function showSubList(key) {
	childList = document.getElementsByClassName('child-list');

	for (var i = childList.length - 1; i >= 0; i--) {
		childList[i].style.display = 'none';
	}

	list = document.getElementById('children-' + key);

	list.style.display = 'block';
	submenu.style.display = "block";
}

function showSubList2(key) {
	childList = document.getElementsByClassName('child-list');

	for (var i = childList.length - 1; i >= 0; i--) {
		childList[i].style.display = 'none';
	}

	list = document.getElementById('children2-' + key);
	list.style.display = 'block';
	submenu2.style.display = "block";
}



// мобильное меню категорий
var btbMobMenu = document.getElementById("catalog-button-mob");
var mobMenu = document.getElementById('mobile-menu');
var mobMenuClose = document.getElementById('mobMenuClose');
if(btbMobMenu){
	mobMenu.style.display = "none";
	btbMobMenu.addEventListener('click', function(){
		if(mobMenu.style.display == 'none'){
			mobMenu.style.display = 'block';
		}
		else{
			mobMenu.style.display = 'none';
		}
	});
	mobMenuClose.addEventListener('click', function(){
		mobMenu.style.display = 'none';
		window.scrollTo(0, 0);

	})
}

// мобильное меню категорий

// фильтр на странице категорий

var filterItem = document.getElementsByClassName('filter-item');
if(filterItem){
	for(i=0; i<filterItem.length; i++){
		var filterArrow = filterItem[i].getElementsByClassName('filter-item-open')[0];
		filterArrow.addEventListener('click', function(){
			var filterCont = this.nextSibling.nextSibling;	
			if(filterCont.style.display == "none" || filterCont.style.display == ''){
				filterCont.style.display = "block";
				this.getElementsByTagName('img')[0].style.cssText = "transform: scale(1, -1)";
			}
			else{
				filterCont.style.display = "none";
				this.getElementsByTagName('img')[0].style.cssText = "transform: scale(-1, 1)";
			};


		});
		
		
	}
	var closeFilter = document.getElementsByClassName('filter-item-close');
	for(i=0; i<closeFilter.length; i++){
		closeFilter[i].addEventListener('click', function(){
			this.parentNode.style.display = "none";
			this.parentNode.parentNode.getElementsByTagName('img')[0].style.cssText = "transform: scale(-1, 1)";
		});
	}
	var titleFilter = document.getElementsByClassName('filter-item-title');
	for(i=0; i<titleFilter.length; i++){
		titleFilter[i].addEventListener('click', function(){
			this.nextSibling.nextSibling.nextSibling.nextSibling.style.display = "block";

			this.parentNode.getElementsByTagName('img')[0].style.cssText = "transform: scale(1, -1)";
		});
	}
}

// фильтр на странице категорий

// табы на странице продукта
var productTab1 = document.getElementById('productTab1');

if(productTab1){
	var productTab2 = document.getElementById('productTab2');
	var productInfoBlock = document.getElementById('product-info-block');
	var feedbackBlock = document.getElementById('feedback-block');
	var toMakeFeed = document.getElementsByClassName('toMakeFeed');
	productTab2.addEventListener('click', function(){
		productInfoBlock.style.display = "none";
		feedbackBlock.style.display = "block";
		productTab2.classList.add('product-tab-active') ;
		productTab1.classList.remove('product-tab-active') ;
	});
	productTab1.addEventListener('click', function(){
		productInfoBlock.style.display = "block";
		feedbackBlock.style.display = "none";
		productTab1.classList.add('product-tab-active') ;
		productTab2.classList.remove('product-tab-active') ;
	});
	var w = screen.width;
	for(i=0; i<toMakeFeed.length; i++){
		toMakeFeed[i].addEventListener('click', function(){
			productInfoBlock.style.display = "none";
			feedbackBlock.style.display = "block";
			productTab2.classList.add('product-tab-active') ;
			productTab1.classList.remove('product-tab-active') ;
			window.scrollTo(0, 650);
		})
	}
	
}


// выпадающее подменю справа

var submenuItem = document.getElementsByClassName('category-menu-item');
var submenu = document.getElementById('submenu');
if(submenu){
	var w = screen.width;
	if(w > 992){
		var key = 0;
		for(i=0; i<submenuItem.length; i++){
			submenuItem[i].addEventListener('mouseover', function(){
				key = this.dataset.key;
				name = this.dataset.name;
				showSubList(key);
				var posIt = this.getBoundingClientRect();
				var posOfS = this.offsetTop;
				submenu.style.top = posOfS + 210 + 'px';
				submenu.style.left = posIt.right + 'px';
			});
			submenuItem[i].addEventListener('mouseout', function(){
				submenu.style.display = "none";
			});
			submenu.addEventListener('mouseover', function(){
				submenu.style.display = "block";
			});

			submenu.addEventListener('mouseout', function() {
				submenu.style.display = "none";
			});
		}
	}
}

// выпадающее подменю справа
// выпадающее подменю справа

var submenuItem2 = document.getElementsByClassName('category-menu-item2');
var submenu2 = document.getElementById('submenu2');
if(submenu2){
	var w = screen.width;
	if(w > 992){
		var key = 0;
		for(i=0; i<submenuItem2.length; i++){
			(function(i){
			submenuItem2[i].addEventListener('mouseover', function(){
				key = this.dataset.key;
				showSubList2(key);
				console.log(this);
				var posIt = this.parentNode.parentNode.parentNode.parentNode.parentNode.getBoundingClientRect();
				var posOfS = this.offsetTop;
				var n = this.index;
				console.log(n);
				submenu2.style.top = (i * 38) + 'px';
				submenu2.style.left =(posIt.right - posIt.left - 30) + 'px';
				console.log(posIt);
				console.log(submenu2.style.top);
			});
			})(i);
			
			submenuItem2[i].addEventListener('mouseout', function(){
				submenu2.style.display = "none";
			});
			submenu2.addEventListener('mouseover', function(){
				submenu2.style.display = "block";
			});

			submenu2.addEventListener('mouseout', function() {
				submenu2.style.display = "none";
			});
		}
	}
}

// выпадающее подменю справа

// табы на странице продукта

// выпадающее меню на второстепенных страницах
var q = screen.width;
var mainMenuBlock = document.getElementById('mainMenu');
var catalogButton = document.getElementById('catalog-button');
// var categoryMenuSecond = document.getElementById('category-menu-second');
// if(categoryMenuSecond){
// 	var w = screen.width;
// 	if(w > 992){


// 		catalogButton.addEventListener('mouseover', function(){
// 			var catalogLeft = catalogButton.getBoundingClientRect().left;
// 			mainMenuBlock.style.left = catalogLeft + "px";
// 			mainMenuBlock.style.display = "block";
// 		});
// 		catalogButton.addEventListener('mouseout', function(){
// 			categoryMenuSecond.style.display = "none";
// 		});
// 		categoryMenuSecond.addEventListener('mouseover', function(){
// 			categoryMenuSecond.style.display = "block";
// 		});
// 		categoryMenuSecond.addEventListener('mouseout', function(){
// 			categoryMenuSecond.style.display = "none";
// 		// });
// 		for(i=0; i<submenuItem.length; i++){
// 			submenuItem[i].addEventListener('mouseout', function(){
// 				categoryMenuSecond.style.display = "none";

// 			});
// 		}
// 	}
// )};



function getIndex() {
	var ourUrl = window.location.href;

	return	ourUrl == "http://avaks.ap.org.ua/index.php?route=common/home" || 
	ourUrl == "http://avaks.ap.org.ua/index.php" || 
	ourUrl == "http://avaks.ap.org.ua/";
}


var index = getIndex();




if(q > 992){
	if(!index){
		catalogButton.addEventListener('mouseover', function(){
			var catalogLeft = catalogButton.getBoundingClientRect().left;
			// mainMenuBlock.style.left = catalogLeft + "px";
			mainMenuBlock.style.display = "block";
		});
		catalogButton.addEventListener('mouseout', function(){
			mainMenuBlock.style.display = "none";
		});
		mainMenuBlock.addEventListener('mouseover', function(){
			mainMenuBlock.style.display = "block";
		});
		mainMenuBlock.addEventListener('mouseout', function(){
			mainMenuBlock.style.display = "none";
		});
	}
}


// 	}

// } else{
// 	mainMenuBlock.style.display = "none";
// };


// var submenuItem = document.getElementsByClassName('category-menu-item');
// var submenu = document.getElementById('submenu');
// if(submenu){
// 	var w = screen.width;
// 	if(w > 992){
// 		var key = 0;
// 		for(i=0; i<submenuItem.length; i++){
// 			submenuItem[i].addEventListener('mouseover', function(){
// 				key = this.dataset.key;
// 				name = this.dataset.name;
// 				showSubList(key);
// 				var posIt = this.getBoundingClientRect();
// 				var posOfS = this.offsetTop;
// 				submenu.style.top = posOfS + 210 + 'px';
// 				submenu.style.left = posIt.right + 'px';
// 			});
// 			submenuItem[i].addEventListener('mouseout', function(){
// 				submenu.style.display = "none";
// 			});
// 			submenu.addEventListener('mouseover', function(){
// 				submenu.style.display = "block";
// 			});

// 			submenu.addEventListener('mouseout', function() {
// 				submenu.style.display = "none";
// 			});
// 		}
// 	}
// }
// выпадающее меню на второстепенных страницах

//стрелочка "Наверх"
var arrowUp = document.getElementById("toTop");

window.onscroll = function() {

	var pageY = window.pageYOffset || document.documentElement.scrollTop;
	if (pageY > 500) {
		arrowUp.style.display ="block";

	}
	else{
		arrowUp.style.display ="none";
	};
};

arrowUp.addEventListener('click', function(){
	var body = $("html, body");
	body.stop().animate({scrollTop:0}, '500', 'swing');
});
//стрелочка "Наверх"
//иконки "желание" и "сравнение"

  var toWish = document.getElementsByClassName('toWish');
  var toComp = document.getElementsByClassName('toComp');
  if(toWish){
    for(i=0; i < toWish.length; i++){
      toWish[i].addEventListener('click', function(){
        if(this.src == 'catalog/view/theme/default/images/icon-to-wish-product-g.png'){
          this.src = 'catalog/view/theme/default/images/icon-to-wish-product-w.png';
        }
        else{
             this.src = 'catalog/view/theme/default/images/icon-to-wish-product-g.png';
        }

      })
    };
     for(i=0; i < toComp.length; i++){
      toComp[i].addEventListener('click', function(){
        if(this.src == 'catalog/view/theme/default/images/icon-to-comp-product-g.png'){
          this.src = 'catalog/view/theme/default/images/icon-to-comp-product-w.png';
        }
        else{
             this.src = 'catalog/view/theme/default/images/icon-to-comp-product-g.png';
        }

      })
    };

  };
//иконки "желание" и "сравнение"

});


$(document).ready(function() {

	var owl = $("#owl-demo");

	owl.owlCarousel({
      items : 6, //10 items above 1000px browser width
      itemsDesktop : [1000,5], //5 items between 1000px and 901px
      itemsDesktopSmall : [900,3], // betweem 900px and 601px
      itemsTablet: [600,2], //2 items between 600 and 0
      itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
  });
	owl.trigger('owl.play',3000);
  // Custom Navigation Events
  $(".next").click(function(){
  	owl.trigger('owl.next');
  })
  $(".prev").click(function(){
  	owl.trigger('owl.prev');
  })

  var owl2 = $("#owl-demo2");

  owl2.owlCarousel({
      items : 3, //10 items above 1000px browser width
      itemsDesktop : [1000,3], //5 items between 1000px and 901px
      itemsDesktopSmall : [900,2], // betweem 900px and 601px
      itemsTablet: [600,2], //2 items between 600 and 0
      itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
  });
  $(".next").click(function(){
  	owl2.trigger('owl.next');
  })
  $(".prev").click(function(){
  	owl2.trigger('owl.prev');
  })
  owl2.trigger('owl.play',5000);
  var owl3 = $("#owl-demo3");

  owl3.owlCarousel({
      items : 4, //10 items above 1000px browser width
      itemsDesktop : [1000,3], //5 items between 1000px and 901px
      itemsDesktopSmall : [900,2], // betweem 900px and 601px
      itemsTablet: [600,2], //2 items between 600 and 0
      itemsMobile : true // itemsMobile disabled - inherit from itemsTablet option
  });
  $(".next").click(function(){
  	owl3.trigger('owl.next');
  })
  $(".prev").click(function(){
  	owl3.trigger('owl.prev');
  })
  owl3.trigger('owl.play',5000);
  var owl4 = $("#owl-demo4");

  owl4.owlCarousel({
      items : 1, //10 items above 1000px browser width
      itemsDesktop : [1000,1], //5 items between 1000px and 901px
      itemsDesktopSmall : [900,1], // betweem 900px and 601px
      itemsTablet: [600,1], //2 items between 600 and 0
      itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
  });
  owl4.trigger('owl.play',4000);

});