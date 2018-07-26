  # setLocal: (x,y) ->
  #   return if not y?
  #   if localStorage.getItem(x) is y then return false 
  #   console.log "setting #{x} to: #{y}"
  #   localStorage.setItem x, y
  #   true
  # getLocalS: (x) ->  
    # console.log "local[#{x}] = #{z = localStorage.getItem x}", z

Function::getter = (prop, get) ->
  Object.defineProperty @prototype, prop,  { get, configurable: yes }

Function::setter = (prop, set) ->
  Object.defineProperty @prototype, prop,  { set, configurable: yes }
      
class App
  constructor: ->
    @c = $ '#content'
  
  @getter 'page', -> localStorage.getItem 'page'
  @setter 'page', (p) -> localStorage.setItem 'page', p
  swap: (html, cb) ->
    # console.log "swapping with #{html}" 
    @c.animate height: '0px', ->
      newdiv = $('<div>').addClass('page').html html
      # newdiv.eq(0).addClass 'page'
      console.log(kids = $(@).children())
      # kids.trigger('remove')
      kids.remove()
      window.pagePurge and window.pagePurge()
      $(@).append newdiv
      cbanim = => $(@).animate height: '100%'
      if !cb then cbanim() else cb(newdiv, cbanim)
  swapGet: (get) ->  $.get get, (data) => @swap data
  home: ->
    # if $('#slides').length then return
    @swap '<div id="slides"></div>', (d, cb) -> 
      d.vegas
        slides: glamourshots[0].split(',').map (x) -> src: x
        animation: 'random'
        shuffle: true
        play: cb
  selectIt: (x) ->
    # x = x or @.page
    if !x or x is 'home'
      # console.log 'fart'
      @home()
    else
      # if @setLocalS 'using', x
      # console.log "swapping with #{area}"
      @swapGet "/render/#{x}"
    closeMenu()
$ ->
  window.app = new App()
  console.log "buenos dias!", app
  $('#logo').on 'click', -> app.home()
  $('#hamburger').on 'click', toggleMenu
  $(window).resize ->
    $('.vegas-container').css height: ''
    
  $('#menu li').on 'click', (e) ->
    tap()
    # t = $(e.target)
    li = $(e.target.closest 'li').data 'menu'
    console.log li
    if isMobile() #and $(@).hasClass 'hover'
      m = $('#menu')
      tapped = m.data('tapped') is li
      m.data tapped: tapped and null or li
      tapped and app.selectIt li or snap()
    else
      app.selectIt li
  app.selectIt()
