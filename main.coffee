cssify = require 'cssify'

cssify.byUrl x for x in [
  # '//netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
  # '//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'
]

global._ = require 'lodash'
mq = require 'jquery-matchmedia'
# md = require 'mobile-detect'

global.isMobile = ->
  md = new MobileDetect(window.navigator.userAgent)
  !!md.phone() or !!md.tablet()


# $ = jQuery
$.fn.zebraTable = (options) ->
    defaults =
        evenColor: '#ccc'
        oddColor : '#eee'

    options = $.extend(defaults, options)
    @each ->
        $("tr:even", this).css('background-color', options.evenColor)
        $("tr:odd" , this).css('background-color', options.oddColor)

ion.sound
  sounds: [{
    name: 'button_tiny'
    alias: 'snap'
  },{
    name: 'camera_flashing'
    alias: 'crackle'
  },{
    name: 'water_droplet_3'
    alias: 'pop'
  }]
  path: '/node_modules/ion-sound/sounds/'
  preload: true
ion.sound
  sounds: [{
    name: 'tap-warm'
    alias: 'tap'
  }]
  path: '/octave/Octave-Sounds/taps/'
  preload: true

['snap','crackle','pop', 'tap'].forEach (x) ->
  window[x] = ->  ion.sound.play x


  # $('#slides').css position: 'absolute'
  #           c = $('#content')
  #           h = $('#header').height()
  #           d = $(data)
  #           c.animate top: '100%', ->
  #             $(@).html(d)
  #             .animate top: h

preventDefault = (e) -> e.preventDefault()
for x in ['disable', 'enable']
  window["#{x}Scroll"] = -> 
    document.body["#{x is 'disable' and 'add' or 'remove'}EventListener"] 'touchmove', preventDefault, passive: false

disableScroll()
$ ->
  $('body').scrollTop(1);

  # console.log 'hello, from main!', $.mq
  
  # $(window).resize ->
    # $('.vegas-container').css height: ''
  
  # $(document).bind 'mouseup touchend', (e) ->
  #   if $('#hamburger').is e.target then slideMenu()
  #   else if $('#menu').hasClass 'tapped'
  #     return
  #   else if $('#menu').hasClass 'open'
  #     slideMenu()

  $.mq.action 'sm', ->
    console.log 'sm'
    # $('#menu').css left: 0
    # $('#toggle').removeClass 'off'
  $.mq.action 'md', ->
    console.log 'md'
    # $('#toggle').addClass 'off'
  $.mq.action 'lg', ->
    console.log 'lg'
  # $ '#bar'
  # .click ->
  #   $ '#menu'.toggle()
    # .toggleClass 'in'
# site = '/113/_Official Site'

# global.shots = require 'glob'
# .sync("#{site}/img/glamour/*.+(ti[f]f|jpg|png|gif[f])")
# .map (g) -> g.replace site, ''


###
    * Normalized hide address bar for iOS & Android
    * (c) Scott Jehl, scottjehl.com
    * MIT License
  (function( win ){
    var doc = win.document;
    
    // If there's a hash, or addEventListener is undefined, stop here
    if( !location.hash && win.addEventListener ){
      
      //scroll to 1
      window.scrollTo( 0, 1 );
      var scrollTop = 1,
        getScrollTop = function(){
          return win.pageYOffset || doc.compatMode === "CSS1Compat" && doc.documentElement.scrollTop || doc.body.scrollTop || 0;
        },
      
        //reset to 0 on bodyready, if needed
        bodycheck = setInterval(function(){
          if( doc.body ){
            clearInterval( bodycheck );
            scrollTop = getScrollTop();
            win.scrollTo( 0, scrollTop === 1 ? 0 : 1 );
          }	
        }, 15 );
      
      win.addEventListener( "load", function(){
        setTimeout(function(){
          //at load, if user hasn't scrolled more than 20 or so...
          if( getScrollTop() < 20 ){
            //reset to hide addr bar at onload
            win.scrollTo( 0, scrollTop === 1 ? 0 : 1 );
          }
        }, 0);
      } );
    }
  })( this );


  ((win) ->
    doc = win.document
    # If there's a hash, or addEventListener is undefined, stop here
    if !location.hash and win.addEventListener
      #scroll to 1
      window.scrollTo 0, 1
      scrollTop = 1

      getScrollTop = ->
        win.pageYOffset or doc.compatMode == 'CSS1Compat' and doc.documentElement.scrollTop or doc.body.scrollTop or 0

      bodycheck = setInterval((->
        if doc.body
          clearInterval bodycheck
          scrollTop = getScrollTop()
          win.scrollTo 0, if scrollTop == 1 then 0 else 1
        return
      ), 15)
      win.addEventListener 'load', ->
        setTimeout (->
          #at load, if user hasn't scrolled more than 20 or so...
          if getScrollTop() < 20
            #reset to hide addr bar at onload
            win.scrollTo 0, if scrollTop == 1 then 0 else 1
          return
        ), 0
        return
    return
  ) this

###
