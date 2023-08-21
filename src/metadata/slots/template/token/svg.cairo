use metadata::metadata::common::models::TokenData;
use array::ArrayTrait;

// TODO: svgenerator?

fn svg_header(ref data: Array<felt252>) {
    data.append('<svg width=\\"316\\" height=\\"');
    data.append('360\\" viewBox=\\"0 0 316 360\\');
    data.append('" fill=\\"none\\" xmlns=\\"http');
    data.append('://www.w3.org/2000/svg\\" xmlns');
    data.append(':xlink=\\"http://www.w3.org/199');
    data.append('9/xlink\\">');
}

fn svg_styles(ref data: Array<felt252>) {
    data.append('<style> @import url(\\"https://');
    data.append('fonts.googleapis.com/css2?famil');
    data.append('y=Inter:wght@400;500;600;700&di');
    data.append('splay=swap\\"); ');
    data.append('svg text { -webkit-user-select:');
    data.append(' none; -moz-user-select: none; ');
    data.append('-ms-user-select: none; user-sel');
    data.append('ect: none; -webkit-tap-highligh');
    data.append('t-color: rgba(255, 255, 255, 0)');
    data.append('; } </style>');
}

fn svg_bg_filters(ref data: Array<felt252>) {
    data.append('<g filter=\\"url(#filter0_d)\\"');
    data.append(' clip-path=\\"url(#clip0)\\"> <');
    data.append('path d=\\"M376 11C376 6.58172 3');
    data.append('72.418 3 368 3H-86C-90.4183 3 -');
    data.append('94 6.58172 -94 11V356H376V11Z\\');
    data.append('" fill=\\"url(#pattern0)\\" /> ');
    data.append('<path d=\\"M376 11C376 6.58172 ');
    data.append('372.418 3 368 3H-86C-90.4183 3 ');
    data.append('-94 6.58172 -94 11V356H376V11Z');
    data.append('\\" fill=\\"url(#paint0_linear)');
    data.append('\\" /> <g filter=\\"url(#filter');
    data.append('1_b)\\"> <rect x=\\"4\\" y=\\"4');
    data.append('\\" width=\\"308\\" height=\\"3');
    data.append('56\\" fill=\\"url(#paint1_linea');
    data.append('r)\\" fill-opacity=\\"0.01\\" /');
    data.append('> </g>');
}

fn svg_lower_components_filters(ref data: Array<felt252>) {
    data.append('<g filter=\\"url(#filter2_bdi)');
    data.append('\\"> <g opacity=\\"0.4\\" filte');
    data.append('r=\\"url(#filter3_bdi)\\"> <rec');
    data.append('t x=\\"12\\" y=\\"231\\" width=');
    data.append('\\"292\\" height=\\"55\\" rx=\\');
    data.append('"8\\" fill=\\"white\\" fill-opa');
    data.append('city=\\"0.1\\" shape-rendering=');
    data.append('\\"crispEdges\\" /> <rect x=\\"');
    data.append('12\\" y=\\"231\\" width=\\"292');
    data.append('\\" height=\\"55\\" rx=\\"8\\" ');
    data.append('fill=\\"url(#pattern1)\\" fill-');
    data.append('opacity=\\"0.08\\" style=\\"mix');
    data.append('-blend-mode:overlay\\" shape-re');
    data.append('ndering=\\"crispEdges\\" /> <re');
    data.append('ct x=\\"12.5\\" y=\\"231.5\\" w');
    data.append('idth=\\"291\\" height=\\"54\\" ');
    data.append('rx=\\"7.5\\" stroke=\\"#D0D1D6');
    data.append('\\" stroke-opacity=\\"0.1\\" sh');
    data.append('ape-rendering=\\"crispEdges\\" ');
    data.append('/> </g>');
}

//
// Dynamic Text
//
fn svg_6(ref data: Array<felt252>) {
    data.append('<text fill=\\"#D0D1D6\\" fill-o');
    data.append('pacity=\\"0.8\\" xml:space=\\"p');
    data.append('reserve\\" style=\\"white-space');
    data.append(': pre\\" font-family=\\"Inter\\');
    data.append('" font-size=\\"11\\" font-weigh');
    data.append('t=\\"500\\" letter-spacing=\\"0');
    data.append('em\\"> <tspan x=\\"28\\" y=\\"2');
    data.append('52.5\\">Carbon units</tspan> </');
    data.append('text> <text fill=\\"#EBECF0\\" ');
    data.append('xml:space=\\"preserve\\" style=');
    data.append('\\"white-space: pre\\" font-fam');
    data.append('ily=\\"Inter\\" font-size=\\"14');
    data.append('\\" font-weight=\\"bold\\" lett');
    data.append('er-spacing=\\"0em\\"> <tspan x=');
    data.append('\\"28\\" y=\\"272.091\\">422 To');
    data.append('ns</tspan> </text> <text fill=');
    data.append('\\"#D0D1D6\\" fill-opacity=\\"0');
    data.append('.8\\" xml:space=\\"preserve\\" ');
    data.append('style=\\"white-space: pre\\" fo');
    data.append('nt-family=\\"Inter\\" font-size');
    data.append('=\\"11\\" font-weight=\\"500\\"');
    data.append(' letter-spacing=\\"0em\\"> <tsp');
    data.append('an x=\\"117.5\\" y=\\"252.5\\">');
    data.append('Ends in</tspan> </text> <text f');
    data.append('ill=\\"#EBECF0\\" xml:space=\\"');
    data.append('preserve\\" style=\\"white-spac');
    data.append('e: pre\\" font-family=\\"Inter');
    data.append('\\" font-size=\\"14\\" font-wei');
    data.append('ght=\\"bold\\" letter-spacing=');
    data.append('\\"0em\\"> <tspan x=\\"117.5\\"');
    data.append(' y=\\"272.091\\">2052</tspan> <');
    data.append('/text> <text fill=\\"#EFECEA\\"');
    data.append(' xml:space=\\"preserve\\" style');
    data.append('=\\"white-space: pre\\" font-fa');
    data.append('mily=\\"Inter\\" font-size=\\"1');
    data.append('4\\" font-weight=\\"600\\" lett');
    data.append('er-spacing=\\"0em\\"> <tspan x=');
    data.append('\\"257\\" y=\\"256.091\\">63%</');
    data.append('tspan> </text>');
}

fn svg_7(ref data: Array<felt252>) {
    data.append('<text fill=\\"#D0D1D6\\" fill-o');
    data.append('pacity=\\"0.8\\" xml:space=\\"p');
    data.append('reserve\\" style=\\"white-space');
    data.append(': pre\\" font-family=\\"Inter\\');
    data.append('" font-size=\\"10\\" font-weigh');
    data.append('t=\\"500\\" letter-spacing=\\"0');
    data.append('em\\"> <tspan x=\\"24\\" y=\\"3');
    data.append('15.636\\">Surface</tspan> </tex');
    data.append('t> <text fill=\\"#EBECF0\\" xml');
    data.append(':space=\\"preserve\\" style=\\"');
    data.append('white-space: pre\\" font-family');
    data.append('=\\"Inter\\" font-size=\\"14\\"');
    data.append(' font-weight=\\"bold\\" letter-');
    data.append('spacing=\\"0em\\"> <tspan x=\\"');
    data.append('24\\" y=\\"333.091\\">250m</tsp');
    data.append('an> </text> <text fill=\\"#EBEC');
    data.append('F0\\" xml:space=\\"preserve\\" ');
    data.append('style=\\"white-space: pre\\" fo');
    data.append('nt-family=\\"Inter\\" font-size');
    data.append('=\\"14\\" font-weight=\\"bold\\');
    data.append('" letter-spacing=\\"0em\\"> <ts');
    data.append('pan x=\\"64.25\\" y=\\"333.091');
    data.append('\\">&#xb2;</tspan> </text> <tex');
    data.append('t fill=\\"#D0D1D6\\" fill-opaci');
    data.append('ty=\\"0.8\\" xml:space=\\"prese');
    data.append('rve\\" style=\\"white-space: pr');
    data.append('e\\" font-family=\\"Inter\\" fo');
    data.append('nt-size=\\"10\\" font-weight=\\');
    data.append('"500\\" letter-spacing=\\"0em\\');
    data.append('"> <tspan x=\\"117\\" y=\\"315.');
    data.append('636\\">Type</tspan> </text> <te');
    data.append('xt fill=\\"#EFECEA\\" xml:space');
    data.append('=\\"preserve\\" style=\\"white-');
    data.append('space: pre\\" font-family=\\"In');
    data.append('ter\\" font-size=\\"14\\" font-');
    data.append('weight=\\"bold\\" letter-spacin');
    data.append('g=\\"0em\\"> <tspan x=\\"117\\"');
    data.append(' y=\\"333.091\\">ARR</tspan> </');
    data.append('text> <text fill=\\"#D0D1D6\\" ');
    data.append('fill-opacity=\\"0.8\\" xml:spac');
    data.append('e=\\"preserve\\" style=\\"white');
    data.append('-space: pre\\" font-family=\\"I');
    data.append('nter\\" font-size=\\"10\\" font');
    data.append('-weight=\\"500\\" letter-spacin');
    data.append('g=\\"0em\\"> <tspan x=\\"186\\"');
    data.append(' y=\\"315.636\\">Impact on</tsp');
    data.append('an> </text> <text fill=\\"#EFEC');
    data.append('EA\\" xml:space=\\"preserve\\" ');
    data.append('style=\\"white-space: pre\\" fo');
    data.append('nt-family=\\"Inter\\" font-size');
    data.append('=\\"14\\" font-weight=\\"bold\\');
    data.append('" letter-spacing=\\"0em\\"> <ts');
    data.append('pan x=\\"181\\" y=\\"333.091\\"');
    data.append('>3 SDG&#x2019;s</tspan> </text>');
}

// Progress bar
fn svg_8(ref data: Array<felt252>) {
    data.append('<path d=\\"M179 269h106\\" stro');
    data.append('ke=\\"url(#paint2_linear)\\" st');
    data.append('roke-opacity=\\"0.3\\" stroke-w');
    data.append('idth=\\"8\\" stroke-linecap=\\"');
    data.append('round\\" /> <path d=\\"M180 269');
    data.append('H244\\" stroke=\\"url(#paint3_l');
    data.append('inear)\\" stroke-opacity=\\"0.8');
    data.append('\\" stroke-width=\\"4\\" stroke');
    data.append('-linecap=\\"round\\" />');
}

// SDGs images + bg
fn svg_9(ref data: Array<felt252>) {
    data.append('<rect x=\\"246\\" y=\\"306\\" w');
    data.append('idth=\\"30\\" height=\\"30\\" r');
    data.append('x=\\"2\\" fill=\\"#272727\\" />');
    data.append(' <rect x=\\"246\\" y=\\"306\\" ');
    data.append('width=\\"30\\" height=\\"30\\" ');
    data.append('rx=\\"2\\" fill=\\"url(#pattern');
    data.append('2)\\" fill-opacity=\\"0.6\\" />');
    data.append(' <rect x=\\"254\\" y=\\"306\\" ');
    data.append('width=\\"30\\" height=\\"30\\" ');
    data.append('rx=\\"2\\" fill=\\"#272727\\" /');
    data.append('> <rect x=\\"254\\" y=\\"306\\"');
    data.append(' width=\\"30\\" height=\\"30\\"');
    data.append(' rx=\\"2\\" fill=\\"url(#patter');
    data.append('n3)\\" fill-opacity=\\"0.6\\" /');
    data.append('> <rect x=\\"262\\" y=\\"306\\"');
    data.append(' width=\\"30\\" height=\\"30\\"');
    data.append(' rx=\\"2\\" fill=\\"#272727\\" ');
    data.append('/> <rect x=\\"262\\" y=\\"306\\');
    data.append('" width=\\"30\\" height=\\"30\\');
    data.append('" rx=\\"2\\" fill=\\"url(#patte');
    data.append('rn4)\\" fill-opacity=\\"0.6\\" ');
    data.append('/> </g> </g>');
}

// Live group
fn svg_10(ref data: Array<felt252>) {
    data.append('<g filter=\\"url(#filter4_b)\\"');
    data.append('> <rect x=\\"246\\" y=\\"20\\" ');
    data.append('width=\\"50\\" height=\\"22\\" ');
    data.append('rx=\\"11\\" fill=\\"#1F2128\\" ');
    data.append('fill-opacity=\\"0.2\\" /> <circ');
    data.append('le cx=\\"256\\" cy=\\"31\\" r=');
    data.append('\\"3\\" fill=\\"#09E1A1\\" /> <');
    data.append('text fill=\\"#0AF2AD\\" xml:spa');
    data.append('ce=\\"preserve\\" style=\\"whit');
    data.append('e-space: pre\\" font-family=\\"');
    data.append('Inter\\" font-size=\\"12\\" fon');
    data.append('t-weight=\\"500\\" letter-spaci');
    data.append('ng=\\"0em\\"> <tspan x=\\"264.3');
    data.append('11\\" y=\\"35.3636\\">Live</tsp');
    data.append('an> </text> <rect x=\\"246.5\\"');
    data.append(' y=\\"20.5\\" width=\\"49\\" he');
    data.append('ight=\\"21\\" rx=\\"10.5\\" str');
    data.append('oke=\\"#ABEFC6\\" stroke-opacit');
    data.append('y=\\"0.3\\" /> </g>');
}

// Main text
fn svg_11(ref data: Array<felt252>) {
    data.append('<text fill=\\"#EFECEA\\" font-f');
    data.append('amily=\\"Inter\\" font-size=\\"');
    data.append('21\\" font-weight=\\"700\\" lin');
    data.append('e-height=\\"21\\" letter-spacin');
    data.append('g=\\"-0.03em\\" text-align=\\"l');
    data.append('eft\\"> <tspan x=\\"20\\" y=\\"');
    data.append('176.136\\">Banegas Farm</tspan>');
    data.append(' </text> <text fill=\\"#D0D1D6');
    data.append('\\" fill-opacity=\\"0.8\\" xml:');
    data.append('space=\\"preserve\\" style=\\"w');
    data.append('hite-space: pre\\" font-family=');
    data.append('\\"Inter\\" font-size=\\"10\\" ');
    data.append('letter-spacing=\\"0em\\"> <tspa');
    data.append('n x=\\"20.1074\\" y=\\"195.636');
    data.append('\\">Based in </tspan> </text> <');
    data.append('text fill=\\"#D0D1D6\\" xml:spa');
    data.append('ce=\\"preserve\\" style=\\"whit');
    data.append('e-space: pre\\" font-family=\\"');
    data.append('Inter\\" font-size=\\"10\\" fon');
    data.append('t-weight=\\"600\\" letter-spaci');
    data.append('ng=\\"0em\\"> <tspan x=\\"63.34');
    data.append('96\\" y=\\"195.636\\">Costa Ric');
    data.append('a</tspan> </text> <text fill=\\');
    data.append('"#D0D1D6\\" fill-opacity=\\"0.8');
    data.append('\\" xml:space=\\"preserve\\" st');
    data.append('yle=\\"white-space: pre\\" font');
    data.append('-family=\\"Inter\\" font-size=');
    data.append('\\"10\\" letter-spacing=\\"0em');
    data.append('\\"> <tspan x=\\"20\\" y=\\"209');
    data.append('.636\\">By </tspan> </text> <te');
    data.append('xt fill=\\"#D0D1D6\\" xml:space');
    data.append('=\\"preserve\\" style=\\"white-');
    data.append('space: pre\\" font-family=\\"In');
    data.append('ter\\" font-size=\\"10\\" font-');
    data.append('weight=\\"600\\" letter-spacing');
    data.append('=\\"0em\\"> <tspan x=\\"34.8828');
    data.append('\\" y=\\"209.636\\">Corcovado F');
    data.append('oundation</tspan> </text> <text');
    data.append(' fill=\\"#D0D1D6\\" fill-opacit');
    data.append('y=\\"0.8\\" xml:space=\\"preser');
    data.append('ve\\" style=\\"white-space: pre');
    data.append('\\" font-family=\\"Inter\\" fon');
    data.append('t-size=\\"10\\" letter-spacing=');
    data.append('\\"0em\\"> <tspan x=\\"204\\" y');
    data.append('=\\"195.636\\">Certified by</ts');
    data.append('pan> </text> <text fill=\\"#EFE');
    data.append('CEA\\" xml:space=\\"preserve\\"');
    data.append(' style=\\"white-space: pre\\" f');
    data.append('ont-family=\\"Inter\\" font-siz');
    data.append('e=\\"11\\" font-weight=\\"600\\');
    data.append('" letter-spacing=\\"0em\\"> <ts');
    data.append('pan x=\\"239\\" y=\\"209.5\\">E');
    data.append('RS</tspan> </text>');
}


// ERS logo ?
fn svg_12(ref data: Array<felt252>) {
    data.append('<rect x=\\"268\\" y=\\"185\\" w');
    data.append('idth=\\"28\\" height=\\"28\\" r');
    data.append('x=\\"14\\" fill=\\"#EBECF0\\" f');
    data.append('ill-opacity=\\"0.1\\" /> <rect ');
    data.append('x=\\"275\\" y=\\"192\\" width=');
    data.append('\\"14\\" height=\\"14\\" fill=');
    data.append('\\"url(#pattern5)\\" style=\\"m');
    data.append('ix-blend-mode:screen\\" /> <rec');
    data.append('t x=\\"268.5\\" y=\\"185.5\\" w');
    data.append('idth=\\"27\\" height=\\"27\\" r');
    data.append('x=\\"13.5\\" stroke=\\"#EBECF0');
    data.append('\\" stroke-opacity=\\"0.7\\" st');
    data.append('roke-miterlimit=\\"1.22863\\" s');
    data.append('troke-linecap=\\"round\\" strok');
    data.append('e-dasharray=\\"3 3\\" />');
}


fn svg_13(ref data: Array<felt252>) {
    data.append('<rect x=\\"2\\" y=\\"2\\" width');
    data.append('=\\"312\\" height=\\"356\\" rx=');
    data.append('\\"14\\" stroke=\\"url(#paint4_');
    data.append('angular)\\" stroke-opacity=\\"0');
    data.append('.8\\" stroke-width=\\"4\\" stro');
    data.append('ke-linejoin=\\"round\\" />');
}

fn svg_14(ref data: Array<felt252>) {
    data.append('<path d=\\"M-180 -575H504V-577H');
    data.append('-180V-575ZM505 -574V517H507V-57');
    data.append('4H505ZM504 518H-180V520H504V518');
    data.append('ZM-181 517V-574H-183V517H-181ZM');
    data.append('-180 518C-180.552 518 -181 517.');
    data.append('552 -181 517H-183C-183 518.657 ');
    data.append('-181.657 520 -180 520V518ZM505 ');
    data.append('517C505 517.552 504.552 518 504');
    data.append(' 518V520C505.657 520 507 518.65');
    data.append('7 507 517H505ZM504 -575C504.552');
    data.append(' -575 505 -574.552 505 -574H507');
    data.append('C507 -575.657 505.657 -577 504 ');
    data.append('-577V-575ZM-180 -577C-181.657 -');
    data.append('577 -183 -575.657 -183 -574H-18');
    data.append('1C-181 -574.552 -180.552 -575 -');
    data.append('180 -575V-577Z\\" fill=\\"white');
    data.append('\\" fill-opacity=\\"0.1\\" />');
}

fn generate(data: TokenData) -> Span<felt252> {
    let mut svg: Array<felt252> = Default::default();
    svg_header(ref svg);
    svg_styles(ref svg);
    svg.span()
}


// Defs:

fn svg_15(ref data: Array<felt252>) {
    data.append('<defs> <filter id=\\"filter0_d');
    data.append('\\" x=\\"3\\" y=\\"3\\" width=');
    data.append('\\"310\\" height=\\"354\\" filt');
    data.append('erUnits=\\"userSpaceOnUse\\" co');
    data.append('lor-interpolation-filters=\\"sR');
    data.append('GB\\"> <feFlood flood-opacity=');
    data.append('\\"0\\" result=\\"BackgroundIma');
    data.append('geFix\\" /> <feColorMatrix in=');
    data.append('\\"SourceAlpha\\" type=\\"matri');
    data.append('x\\" values=\\"0 0 0 0 0 0 0 0 ');
    data.append('0 0 0 0 0 0 0 0 0 0 127 0\\" re');
    data.append('sult=\\"hardAlpha\\" /> <feMorp');
    data.append('hology radius=\\"1\\" operator=');
    data.append('\\"dilate\\" in=\\"SourceAlpha');
    data.append('\\" result=\\"effect1_dropShado');
    data.append('w\\" /> <feOffset /> <feColorMa');
    data.append('trix type=\\"matrix\\" values=');
    data.append('\\"0 0 0 0 0.321569 0 0 0 0 0.3');
    data.append('37255 0 0 0 0 0.380392 0 0 0 0.');
    data.append('4 0\\" /> <feBlend mode=\\"norm');
    data.append('al\\" in2=\\"BackgroundImageFix');
    data.append('\\" result=\\"effect1_dropShado');
    data.append('w\\" /> <feBlend mode=\\"normal');
    data.append('\\" in=\\"SourceGraphic\\" in2=');
    data.append('\\"effect1_dropShadow\\" result');
    data.append('=\\"shape\\" /> </filter>');
}

fn svg_16(ref data: Array<felt252>) {
    data.append('<pattern id=\\"pattern0\\" patt');
    data.append('ernContentUnits=\\"objectBoundi');
    data.append('ngBox\\" width=\\"1\\" height=');
    data.append('\\"1\\"> <use xlink:href=\\"#im');
    data.append('age0\\" transform=\\"matrix(0.0');
    data.append('0169159 0 0 0.00225225 -0.06921');
    data.append('84 0) scale(-1, 1) translate(-6');
    data.append('76, 0)\\" /> </pattern>');
}

fn svg_17(ref data: Array<felt252>) {
    data.append('<filter id=\\"filter1_b\\" x=\\');
    data.append('"0\\" y=\\"0\\" width=\\"316\\"');
    data.append(' height=\\"364\\" filterUnits=');
    data.append('\\"userSpaceOnUse\\" color-inte');
    data.append('rpolation-filters=\\"sRGB\\"> <');
    data.append('feFlood flood-opacity=\\"0\\" r');
    data.append('esult=\\"BackgroundImageFix\\" ');
    data.append('/> <feGaussianBlur in=\\"Backgr');
    data.append('oundImageFix\\" stdDeviation=\\');
    data.append('"2\\" /> <feComposite in2=\\"So');
    data.append('urceAlpha\\" operator=\\"in\\" ');
    data.append('result=\\"effect1_backgroundBlu');
    data.append('r\\" /> <feBlend mode=\\"normal');
    data.append('\\" in=\\"SourceGraphic\\" in2=');
    data.append('\\"effect1_backgroundBlur\\" re');
    data.append('sult=\\"shape\\" /> </filter>');
}

fn svg_18(ref data: Array<felt252>) {
    data.append('<filter id=\\"filter2_bdi\\" x=');
    data.append('\\"-8\\" y=\\"137\\" width=\\"3');
    data.append('32\\" height=\\"233\\" filterUn');
    data.append('its=\\"userSpaceOnUse\\" color-');
    data.append('interpolation-filters=\\"sRGB\\');
    data.append('"> <feFlood flood-opacity=\\"0');
    data.append('\\" result=\\"BackgroundImageFi');
    data.append('x\\" /> <feGaussianBlur in=\\"B');
    data.append('ackgroundImageFix\\" stdDeviati');
    data.append('on=\\"6\\" /> <feComposite in2=');
    data.append('\\"SourceAlpha\\" operator=\\"i');
    data.append('n\\" result=\\"effect1_backgrou');
    data.append('ndBlur\\" /> <feColorMatrix in=');
    data.append('\\"SourceAlpha\\" type=\\"matri');
    data.append('x\\" values=\\"0 0 0 0 0 0 0 0 ');
    data.append('0 0 0 0 0 0 0 0 0 0 127 0\\" re');
    data.append('sult=\\"hardAlpha\\" /> <feOffs');
    data.append('et dy=\\"8\\" /> <feGaussianBlu');
    data.append('r stdDeviation=\\"3\\" /> <feCo');
    data.append('mposite in2=\\"hardAlpha\\" ope');
    data.append('rator=\\"out\\" /> <feColorMatr');
    data.append('ix type=\\"matrix\\" values=\\"');
    data.append('0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0');
    data.append(' 0 0 0.05 0\\" /> <feBlend mode');
    data.append('=\\"normal\\" in2=\\"effect1_ba');
    data.append('ckgroundBlur\\" result=\\"effec');
    data.append('t2_dropShadow\\" /> <feBlend mo');
    data.append('de=\\"normal\\" in=\\"SourceGra');
    data.append('phic\\" in2=\\"effect2_dropShad');
    data.append('ow\\" result=\\"shape\\" /> <fe');
    data.append('ColorMatrix in=\\"SourceAlpha\\');
    data.append('" type=\\"matrix\\" values=\\"0');
    data.append(' 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ');
    data.append('0 0 127 0\\" result=\\"hardAlph');
    data.append('a\\" /> <feOffset dy=\\"2\\" />');
    data.append(' <feGaussianBlur stdDeviation=');
    data.append('\\"4\\" /> <feComposite in2=\\"');
    data.append('hardAlpha\\" operator=\\"arithm');
    data.append('etic\\" k2=\\"-1\\" k3=\\"1\\" ');
    data.append('/> <feColorMatrix type=\\"matri');
    data.append('x\\" values=\\"0 0 0 0 1 0 0 0 ');
    data.append('0 1 0 0 0 0 1 0 0 0 0.25 0\\" /');
    data.append('> <feBlend mode=\\"normal\\" in');
    data.append('2=\\"shape\\" result=\\"effect3');
    data.append('_innerShadow\\" /> </filter>');
}

fn svg_19(ref data: Array<felt252>) {
    data.append('<filter id=\\"filter3_bdi\\" x=');
    data.append('\\"-6\\" y=\\"213\\" width=\\"3');
    data.append('28\\" height=\\"91\\" filterUni');
    data.append('ts=\\"userSpaceOnUse\\" color-i');
    data.append('nterpolation-filters=\\"sRGB\\"');
    data.append('> <feFlood flood-opacity=\\"2\\');
    data.append('" result=\\"BackgroundImageFix');
    data.append('\\" /> <feGaussianBlur in=\\"Ba');
    data.append('ckgroundImageFix\\" stdDeviatio');
    data.append('n=\\"9\\" /> <feComposite in2=');
    data.append('\\"SourceAlpha\\" operator=\\"i');
    data.append('n\\" result=\\"effect1_backgrou');
    data.append('ndBlur\\" /> <feColorMatrix in=');
    data.append('\\"SourceAlpha\\" type=\\"matri');
    data.append('x\\" values=\\"0 0 0 0 0 0 0 0 ');
    data.append('0 0 0 0 0 0 0 0 0 0 127 0\\" re');
    data.append('sult=\\"hardAlpha\\" /> <feOffs');
    data.append('et dx=\\"0\\" /> <feGaussianBlu');
    data.append('r stdDeviation=\\"3\\" /> <feCo');
    data.append('mposite in2=\\"hardAlpha\\" ope');
    data.append('rator=\\"out\\" /> <feColorMatr');
    data.append('ix type=\\"matrix\\" values=\\"');
    data.append('0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0');
    data.append(' 0 0 0.05 0\\" /> <feBlend mode');
    data.append('=\\"normal\\" in2=\\"effect1_ba');
    data.append('ckgroundBlur\\" result=\\"effec');
    data.append('t2_dropShadow\\" /> <feBlend mo');
    data.append('de=\\"normal\\" in=\\"SourceGra');
    data.append('phic\\" in2=\\"effect2_dropShad');
    data.append('ow\\" result=\\"shape\\" /> <fe');
    data.append('ColorMatrix in=\\"SourceAlpha\\');
    data.append('" type=\\"matrix\\" values=\\"0');
    data.append(' 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ');
    data.append('0 0 127 0\\" result=\\"hardAlph');
    data.append('a\\" /> <feOffset dy=\\"1\\" />');
    data.append(' <feGaussianBlur stdDeviation=');
    data.append('\\"3.5\\" /> <feComposite in2=');
    data.append('\\"hardAlpha\\" operator=\\"ari');
    data.append('thmetic\\" k2=\\"-1\\" k3=\\"1');
    data.append('\\" /> <feColorMatrix type=\\"m');
    data.append('atrix\\" values=\\"0 0 0 0 1 0 ');
    data.append('0 0 0 1 0 0 0 0 1 0 0 0 0.25 0');
    data.append('\\" /> <feBlend mode=\\"normal');
    data.append('\\" in2=\\"shape\\" result=\\"e');
    data.append('ffect3_innerShadow\\" /> </filt');
    data.append('er>');
}

fn svg_20(ref data: Array<felt252>) {
    data.append('<pattern id=\\"pattern1\\" patt');
    data.append('ernContentUnits=\\"objectBoundi');
    data.append('ngBox\\" width=\\"7.0137\\" hei');
    data.append('ght=\\"37.2364\\"> <use xlink:h');
    data.append('ref=\\"#image1\\" transform=\\"');
    data.append('scale(0.00342466 0.0181818)\\" ');
    data.append('/> </pattern>');
}

fn svg_21(ref data: Array<felt252>) {
    data.append('<pattern id=\\"pattern2\\" patt');
    data.append('ernContentUnits=\\"objectBoundi');
    data.append('ngBox\\" width=\\"1\\" height=');
    data.append('\\"1\\"> <use xlink:href=\\"#im');
    data.append('age2\\" transform=\\"scale(0.00');
    data.append('0976562)\\" /> </pattern>');
}

fn svg_22(ref data: Array<felt252>) {
    data.append('<pattern id=\\"pattern3\\" patt');
    data.append('ernContentUnits=\\"objectBoundi');
    data.append('ngBox\\" width=\\"1\\" height=');
    data.append('\\"1\\"> <use xlink:href=\\"#im');
    data.append('age3\\" transform=\\"scale(0.00');
    data.append('0651042)\\" /> </pattern>');
}

fn svg_23(ref data: Array<felt252>) {
    data.append('<pattern id=\\"pattern4\\" patt');
    data.append('ernContentUnits=\\"objectBoundi');
    data.append('ngBox\\" width=\\"1\\" height=');
    data.append('\\"1\\"> <use xlink:href=\\"#im');
    data.append('age4\\" transform=\\"scale(0.00');
    data.append('0651042)\\" /> </pattern>');
}

fn svg_24(ref data: Array<felt252>) {
    data.append('<filter id=\\"filter4_b\\" x=\\');
    data.append('"226\\" y=\\"0\\" width=\\"90\\');
    data.append('" height=\\"62\\" filterUnits=');
    data.append('\\"userSpaceOnUse\\" color-inte');
    data.append('rpolation-filters=\\"sRGB\\"> <');
    data.append('feFlood flood-opacity=\\"0\\" r');
    data.append('esult=\\"BackgroundImageFix\\" ');
    data.append('/> <feGaussianBlur in=\\"Backgr');
    data.append('oundImageFix\\" stdDeviation=\\');
    data.append('"10\\" /> <feComposite in2=\\"S');
    data.append('ourceAlpha\\" operator=\\"in\\"');
    data.append(' result=\\"effect1_backgroundBl');
    data.append('ur\\" /> <feBlend mode=\\"norma');
    data.append('l\\" in=\\"SourceGraphic\\" in2');
    data.append('=\\"effect1_backgroundBlur\\" r');
    data.append('esult=\\"shape\\" /> </filter>');
}

fn svg_25(ref data: Array<felt252>) {
    data.append('<pattern id=\\"pattern5\\" patt');
    data.append('ernContentUnits=\\"objectBoundi');
    data.append('ngBox\\" width=\\"1\\" height=');
    data.append('\\"1\\"> <use xlink:href=\\"#im');
    data.append('age5\\" transform=\\"translate(');
    data.append('0.0830671) scale(0.00319489)\\"');
    data.append(' /> </pattern>');
}

fn svg_26(ref data: Array<felt252>) {
    data.append('<linearGradient id=\\"paint0_li');
    data.append('near\\" x1=\\"141.394\\" y1=\\"');
    data.append('119.5\\" x2=\\"140.758\\" y2=\\');
    data.append('"355.999\\" gradientUnits=\\"us');
    data.append('erSpaceOnUse\\"> <stop stop-col');
    data.append('or=\\"#0B0D13\\" stop-opacity=');
    data.append('\\"0.4\\" /> <stop offset=\\"1');
    data.append('\\" stop-color=\\"#0B0D13\\" st');
    data.append('op-opacity=\\"0.9\\" /> </linea');
    data.append('rGradient>');
}

fn svg_27(ref data: Array<felt252>) {
    data.append('<linearGradient id=\\"paint1_li');
    data.append('near\\" x1=\\"158\\" y1=\\"4\\"');
    data.append(' x2=\\"158\\" y2=\\"360\\" grad');
    data.append('ientUnits=\\"userSpaceOnUse\\">');
    data.append(' <stop offset=\\"0.41343\\" sto');
    data.append('p-color=\\"#D9D9D9\\" stop-opac');
    data.append('ity=\\"0\\" /> <stop offset=\\"');
    data.append('1\\" stop-color=\\"#D9D9D9\\" s');
    data.append('top-opacity=\\"0.01\\" /> </lin');
    data.append('earGradient>');
}

fn svg_28(ref data: Array<felt252>) {
    data.append('<linearGradient id=\\"paint2_li');
    data.append('near\\" x1=\\"285\\" y1=\\"270');
    data.append('\\" x2=\\"179\\" y2=\\"270\\" g');
    data.append('radientUnits=\\"userSpaceOnUse');
    data.append('\\"> <stop offset=\\"0.395833\\');
    data.append('" stop-color=\\"#A8C4EF\\" /> <');
    data.append('stop offset=\\"1\\" stop-color=');
    data.append('\\"#0AF2AD\\" /> </linearGradie');
    data.append('nt>');
}

fn svg_29(ref data: Array<felt252>) {
    data.append('<linearGradient id=\\"paint3_li');
    data.append('near\\" x1=\\"244\\" y1=\\"270');
    data.append('\\" x2=\\"180\\" y2=\\"270\\" g');
    data.append('radientUnits=\\"userSpaceOnUse');
    data.append('\\"> <stop offset=\\"0.395833\\');
    data.append('" stop-color=\\"#A8C4EF\\" /> <');
    data.append('stop offset=\\"1\\" stop-color=');
    data.append('\\"#0AF2AD\\" /> </linearGradie');
    data.append('nt>');
}

fn svg_30(ref data: Array<felt252>) {
    data.append('<radialGradient id=\\"paint4_an');
    data.append('gular\\" cx=\\"0\\" cy=\\"0\\" ');
    data.append('r=\\"1\\" gradientUnits=\\"user');
    data.append('SpaceOnUse\\" gradientTransform');
    data.append('=\\"translate(101.466 200.286) ');
    data.append('rotate(-45.1732) scale(393.299 ');
    data.append('1391.22)\\"> <stop offset=\\"0.');
    data.append('0230201\\" stop-color=\\"#E8E7E');
    data.append('7\\" /> <stop offset=\\"0.06157');
    data.append('88\\" stop-color=\\"#BAD3CB\\" ');
    data.append('/> <stop offset=\\"0.375\\" sto');
    data.append('p-color=\\"#0AF2AD\\" /> <stop ');
    data.append('offset=\\"0.403687\\" stop-colo');
    data.append('r=\\"#27EABA\\" /> <stop offset');
    data.append('=\\"0.557292\\" stop-color=\\"#');
    data.append('C3C2FF\\" /> <stop offset=\\"0.');
    data.append('75\\" stop-color=\\"#FFFCFC\\" ');
    data.append('/> <stop offset=\\"0.882045\\" ');
    data.append('stop-color=\\"#E8E3E3\\" /> <st');
    data.append('op offset=\\"1\\" stop-color=\\');
    data.append('"#B3B3B3\\" /> </radialGradient');
    data.append('>');
}

fn svg_31(ref data: Array<felt252>) {
    data.append('<clipPath id=\\"clip0\\"> <rect');
    data.append(' x=\\"4\\" y=\\"4\\" width=\\"3');
    data.append('08\\" height=\\"352\\" rx=\\"12');
    data.append('\\" fill=\\"white\\" /> </clipP');
    data.append('ath>');
}
// + b64 JPEG images

fn svg_background_image(ref data: Array<felt252>) {
    data.append('<image id=\\"image0\\" width=\\');
    data.append('"673\\" height=\\"444\\" xlink:');
    data.append('href=\\"data:image/jpeg;base64,');
// Insert background image from provider here
}

fn svg_33(ref data: Array<felt252>) {
    data.append('</defs></svg>');
}

