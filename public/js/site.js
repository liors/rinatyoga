var rinatyoga = {}

rinatyoga.site = {
    init : function() {
        rinatyoga.site.noteEffect();	
    },

    noteEffect : function() {
        $("#notes").delay(3000).fadeOut(1500).fadeIn("slow").delay(3000);
        rinatyoga.site.noteEffect();
    },
    
    schedule : function() {
        $('a.#schedule').css('color', '#008a71');
    },
    map : function() {
        $('a.#map').css('color', '#008a71');
    },
    news : function() {
        $('a.#news').css('color', '#008a71');
    },
    gallery : function() {
        $('a.#gallery').css('color', '#008a71');
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
    }   
}