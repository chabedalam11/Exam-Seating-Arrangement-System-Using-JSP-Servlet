/**
 * Tabslet jQuery plugin
 *
 * @copyright Copyright 2012, Dimitris Krestos
 * @license   Apache License, Version 2.0 (http://www.opensource.org/licenses/apache2.0.php)
 * @link    http://vdw.staytuned.gr
 * @version   v1.4.2
 */
 
/* Slightly modified by http://www.os-templates.com to use the HTML5 figure tag instead of a div tag */

(function($,window,undefined){"use strict";$.fn.tabslet=function(options){var defaults={mouseevent:"click",attribute:"href",animation:false,autorotate:false,pauseonhover:true,delay:2e3,active:1,controls:{prev:".prev",next:".next"}};var options=$.extend(defaults,options);return this.each(function(){function forward(){i=++i%elements.length;options.mouseevent=="hover"?elements.eq(i).trigger("mouseover"):elements.eq(i).click();var e=setTimeout(forward,options.delay);$this.mouseover(function(){if(options.pauseonhover)clearTimeout(e)})}function move(e){if(e=="forward")i=++i%elements.length;if(e=="backward")i=--i%elements.length;elements.eq(i).click()}var $this=$(this);options.mouseevent=$this.data("mouseevent")||options.mouseevent;options.attribute=$this.data("attribute")||options.attribute;options.animation=$this.data("animation")||options.animation;options.autorotate=$this.data("autorotate")||options.autorotate;options.pauseonhover=$this.data("pauseonhover")||options.pauseonhover;options.delay=$this.data("delay")||options.delay;options.active=$this.data("active")||options.active;$this.find("> figure").hide();$this.find("> figure").eq(options.active-1).show();$this.find("> ul li").eq(options.active-1).addClass("active");var fn=eval(function(){$(this).trigger("_before");$this.find("> ul li").removeClass("active");$(this).addClass("active");$this.find("> figure").hide();var e=$(this).find("a").attr(options.attribute);if(options.animation){$this.find(e).animate({opacity:"show"},"slow",function(){$(this).trigger("_after")})}else{$this.find(e).show();$(this).trigger("_after")}return false});var init=eval("$this.find('> ul li')."+options.mouseevent+"(fn)");init;var elements=$this.find("> ul li"),i=options.active-1;if(options.autorotate){setTimeout(forward,0);if(options.pauseonhover)$this.on("mouseleave",function(){setTimeout(forward,1e3)})}$this.find(options.controls.next).click(function(){move("forward")});$this.find(options.controls.prev).click(function(){move("backward")});$this.on("destroy",function(){$(this).removeData()})})};$(document).ready(function(){$('[data-toggle="tabslet"]').tabslet()})})(jQuery)

/* Set-up the slider */

jQuery(document).ready(function() {
    $("#slide-wrapper").tabslet({
        mouseevent: "click", // Select tab on click or on hover - options: click, hover
        attribute: "href", // Use href or alt attribute to select tabs - options: href, alt
        animation: true, // Enables javascript animation effect on tabs change - options: false, true
        autorotate: false, // Enables automatic rotation of the tabs - options: false, true
        pauseonhover: true, // Stops autorotation as long as the mouse is over the tabs - options: false, true
        delay: 8000, // Sets the delay on automatic rotation - options: number in ms
        active: 1, // Select which tab will be visible at the beginning
        controls: {} // Set previous and next element - options: element class
    });
});