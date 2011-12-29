var rinatyoga = {}

rinatyoga.site = {
    init : function() {
        rinatyoga.site.noteColorChange();
    },

    noteColorChange : function() {
        $("#notes header").animate({color: '#e07a00'}, 3000).delay(3000).animate({color: '#e31013'}, 3000)
        rinatyoga.site.noteColorChange();

    },
    
    schedule : function() {
        $('a.#schedule').css('color', '#008a71');
        rinatyoga.site.noteColorChange();
    },
    map : function() {
        $('a.#map').css('color', '#008a71');
        rinatyoga.site.noteColorChange();
    },
    news : function() {
        $('a.#news').css('color', '#008a71');
        rinatyoga.site.noteColorChange();
    },
    gallery : function() {
        $('a.#gallery').css('color', '#008a71');
        rinatyoga.site.noteColorChange();
    },
    rinat : function() {
        $('a.#rinat').css('color', '#008a71');
        rinatyoga.site.noteColorChange();
    },
    about : function() {
        $('a.#about').css('color', '#008a71');
        $('a.#limbs-open').click(function() {
           $("#limbs-text").fadeIn();
           $('a.#limbs-open').hide();
        });
        $('a.#limbs-close').click(function() {
           $("#limbs-text").fadeOut();
           $('a.#limbs-open').show();
        });
        $('a.#series-open').click(function() {
           $("#series-text").fadeIn();
           $('a.#series-open').hide();
        });
        $('a.#series-close').click(function() {
           $("#series-text").fadeOut();
           $('a.#series-open').show();
        });
        $('a.#meditation-open').click(function() {
           $("#meditation-text").fadeIn();
           $('a.#meditation-open').hide();
        });
        $('a.#meditation-close').click(function() {
           $("#meditation-text").fadeOut();
           $('a.#meditation-open').show();
        });
        $('a.#yoga-moms-open').click(function() {
           $("#yoga-moms-text").fadeIn();
           $('a.#yoga-moms-open').hide();
        });
        $('a.#yoga-moms-close').click(function() {
           $("#yoga-moms-text").fadeOut();
           $('a.#yoga-moms-open').show();
        });
        rinatyoga.site.noteColorChange();
    },
    admin : function() {
        $("#noteUpdate").click(function() {
            var header = $("input.header").val();
            var body = $("input.body").val();
            var dataString = 'header='+ header + '&body=' + body;
            $.ajax({
                type: "POST",
                url: "admin/notes",
                data: dataString,
                success: function() {

                }
            });
            return false;
        });
        rinatyoga.site.noteColorChange();
    }   
},

(function(d){function i(){var b=d("script:first"),a=b.css("color"),c=false;if(/^rgba/.test(a))c=true;else try{c=a!=b.css("color","rgba(0, 0, 0, 0.5)").css("color");b.css("color",a)}catch(e){}return c}function g(b,a,c){var e="rgb"+(d.support.rgba?"a":"")+"("+parseInt(b[0]+c*(a[0]-b[0]),10)+","+parseInt(b[1]+c*(a[1]-b[1]),10)+","+parseInt(b[2]+c*(a[2]-b[2]),10);if(d.support.rgba)e+=","+(b&&a?parseFloat(b[3]+c*(a[3]-b[3])):1);e+=")";return e}function f(b){var a,c;if(a=/#([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})/.exec(b))c=
[parseInt(a[1],16),parseInt(a[2],16),parseInt(a[3],16),1];else if(a=/#([0-9a-fA-F])([0-9a-fA-F])([0-9a-fA-F])/.exec(b))c=[parseInt(a[1],16)*17,parseInt(a[2],16)*17,parseInt(a[3],16)*17,1];else if(a=/rgb\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*\)/.exec(b))c=[parseInt(a[1]),parseInt(a[2]),parseInt(a[3]),1];else if(a=/rgba\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9\.]*)\s*\)/.exec(b))c=[parseInt(a[1],10),parseInt(a[2],10),parseInt(a[3],10),parseFloat(a[4])];return c}
d.extend(true,d,{support:{rgba:i()}});var h=["color","backgroundColor","borderBottomColor","borderLeftColor","borderRightColor","borderTopColor","outlineColor"];d.each(h,function(b,a){d.fx.step[a]=function(c){if(!c.init){c.a=f(d(c.elem).css(a));c.end=f(c.end);c.init=true}c.elem.style[a]=g(c.a,c.end,c.pos)}});d.fx.step.borderColor=function(b){if(!b.init)b.end=f(b.end);var a=h.slice(2,6);d.each(a,function(c,e){b.init||(b[e]={a:f(d(b.elem).css(e))});b.elem.style[e]=g(b[e].a,b.end,b.pos)});b.init=true}})(jQuery);