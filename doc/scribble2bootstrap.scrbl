#lang scribble/manual
@(require (file "../bscrbl.rkt"))
@title{Scribble to Bootstrap manual}

This manual describes the command-line tool @code{bscrbl.sh}.

@section{Introduction}

Non eram nescius, Brute, cum, quae summis ingeniis exquisitaque doctrina philosophi Graeco sermone tractavissent, ea Latinis litteris mandaremus, fore ut hic noster labor in varias reprehensiones incurreret. nam quibusdam, et iis quidem non admodum indoctis, totum hoc displicet philosophari. quidam autem non tam id reprehendunt, si remissius agatur, sed tantum studium tamque multam operam ponendam in eo non arbitrantur. erunt etiam, et ii quidem eruditi Graecis litteris, contemnentes Latinas, qui se dicant in Graecis legendis operam malle consumere. postremo aliquos futuros suspicor, qui me ad alias litteras vocent, genus hoc scribendi, etsi sit elegans, personae tamen et dignitatis esse negent. Contra quos omnis dicendum breviter existimo. Quamquam philosophiae quidem vituperatoribus satis responsum est eo libro, quo a nobis philosophia defensa et collaudata est, cum esset accusata et vituperata ab Hortensio. qui liber cum et tibi probatus videretur et iis, quos ego posse iudicare arbitrarer, plura suscepi veritus ne movere hominum studia viderer, retinere non posse. Qui autem, si maxime hoc placeat, moderatius tamen id volunt fieri, difficilem quandam temperantiam postulant in eo, quod semel admissum coerceri reprimique non potest, ut propemodum iustioribus utamur illis, qui omnino avocent a philosophia, quam his, qui rebus infinitis modum constituant in reque eo meliore, quo maior sit, mediocritatem desiderent. Sive enim ad sapientiam perveniri potest, non paranda nobis solum ea, sed fruenda etiam sapientia est; sive hoc difficile est, tamen nec modus est ullus investigandi veri, nisi inveneris, et quaerendi defatigatio turpis est, cum id, quod quaeritur, sit pulcherrimum. etenim si delectamur, cum scribimus, quis est tam invidus, qui ab eo nos abducat? sin laboramus, quis est, qui alienae modum statuat industriae? nam ut Terentianus Chremes non inhumanus, qui novum vicinum non vult 'fodere aut arare aut aliquid ferre denique' -- non enim illum ab industria, sed ab inliberali labore deterret --, sic isti curiosi, quos offendit noster minime nobis iniucundus labor.

@section{Options}

@commandline{scribble2bootstrap mydocument.scrbl}

@commandline{
scribble2bootstrap mydocument.scrbl
what?
}

Bla
@verbatim{
a b c d
e f g h
i j k l
m n o pw


@code{# Main entry point}
@code-input{bscrbl.sh MyFile.scrbl}
@code-output{ output[MyFile.html]}

}
@code{# Main entry point}

This is an unordered list:
@itemlist[
  @item{First}
  @item{Second}
  @item{Third}
  @item{Fourth}
  @item{Fifth}
]

This is an ordered list:
@itemlist[#:style 'ordered
  @item{First}
  @item{Second}
  @item{Third}
  @item{Fourth}
  @item{Fifth}
]

This is a test.
@verbatim{a b
c d}

