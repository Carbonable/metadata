use metadata::metadata::common::models::TokenData;
use array::ArrayTrait;

// TODO: svgenerator?

fn svg_header(ref data: Array<felt252>) {
    data.append('<svg xmlns=\\"http://www.w3.org');
    data.append('/2000/svg\\" fill=\\"none\\" vi');
    data.append('ewBox=\\"0 0 316 361\\">');
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
    data.append('<g filter=\\"url(#a)\\" clip-pa');
    data.append('th=\\"url(#b)\\"><path fill=\\"');
    data.append('url(#c)\\" d=\\"M376 11a8 8 0 0');
    data.append(' 0-8-8H-86a8 8 0 0 0-8 8v345h47');
    data.append('0V11Z\\"/><path fill=\\"url(#d)');
    data.append('\\" d=\\"M376 11a8 8 0 0 0-8-8H');
    data.append('-86a8 8 0 0 0-8 8v345h470V11Z\\');
    data.append('"/><g filter=\\"url(#e)\\"><rec');
    data.append('t width=\\"308\\" height=\\"356');
    data.append('\\" x=\\"4\\" y=\\"4\\" fill=\\');
    data.append('"url(#f)\\" fill-opacity=\\".01');
    data.append('\\"/></g>');
}

fn svg_lower_components_filters(ref data: Array<felt252>) {
    data.append('<g filter=\\"url(#g)\\"><g filt');
    data.append('er=\\"url(#h)\\" opacity=\\".4');
    data.append('\\"><rect width=\\"292\\" heigh');
    data.append('t=\\"56\\" x=\\"12\\" y=\\"231');
    data.append('\\" fill=\\"#fff\\" fill-opacit');
    data.append('y=\\".1\\" rx=\\"8\\" shape-ren');
    data.append('dering=\\"crispEdges\\"/><rect ');
    data.append('width=\\"292\\" height=\\"56\\"');
    data.append(' x=\\"12\\" y=\\"231\\" fill=\\');
    data.append('"url(#i)\\" fill-opacity=\\".08');
    data.append('\\" rx=\\"8\\" shape-rendering=');
    data.append('\\"crispEdges\\" style=\\"mix-b');
    data.append('lend-mode:overlay\\"/><rect wid');
    data.append('th=\\"291\\" height=\\"55\\" x=');
    data.append('\\"12.5\\" y=\\"231.5\\" stroke');
    data.append('=\\"#D0D1D6\\" stroke-opacity=');
    data.append('\\".1\\" rx=\\"7.5\\" shape-ren');
    data.append('dering=\\"crispEdges\\"/></g>');
}

//
// Dynamic Text
//
fn svg_panel_text(ref data: Array<felt252>) {
    data.append('<text fill=\\"#D0D1D6\\" fill-o');
    data.append('pacity=\\"0.8\\" xml:space=\\"p');
    data.append('reserve\\" style=\\"white-space');
    data.append(': pre\\" font-family=\\"Inter\\');
    data.append('" font-size=\\"11\\" font-weigh');
    data.append('t=\\"500\\" letter-spacing=\\"0');
    data.append('em\\"><tspan x=\\"28\\" y=\\"25');
    data.append('2.5\\">Carbon units</tspan></te');
    data.append('xt><text fill=\\"#EBECF0\\" xml');
    data.append(':space=\\"preserve\\" style=\\"');
    data.append('white-space: pre\\" font-family');
    data.append('=\\"Inter\\" font-size=\\"14\\"');
    data.append(' font-weight=\\"bold\\" letter-');
    data.append('spacing=\\"0em\\"><tspan x=\\"2');
    data.append('8\\" y=\\"272.091\\">422 Tons</');
    data.append('tspan></text><text fill=\\"#D0D');
    data.append('1D6\\" fill-opacity=\\"0.8\\" x');
    data.append('ml:space=\\"preserve\\" style=');
    data.append('\\"white-space: pre\\" font-fam');
    data.append('ily=\\"Inter\\" font-size=\\"11');
    data.append('\\" font-weight=\\"500\\" lette');
    data.append('r-spacing=\\"0em\\"><tspan x=\\');
    data.append('"117.5\\" y=\\"252.5\\">Ends in');
    data.append('</tspan></text><text fill=\\"#E');
    data.append('BECF0\\" xml:space=\\"preserve');
    data.append('\\" style=\\"white-space: pre\\');
    data.append('" font-family=\\"Inter\\" font-');
    data.append('size=\\"14\\" font-weight=\\"bo');
    data.append('ld\\" letter-spacing=\\"0em\\">');
    data.append('<tspan x=\\"117.5\\" y=\\"272.0');
    data.append('91\\">2052</tspan></text><text ');
    data.append('fill=\\"#EFECEA\\" xml:space=\\');
    data.append('"preserve\\" style=\\"white-spa');
    data.append('ce: pre\\" font-family=\\"Inter');
    data.append('\\" font-size=\\"14\\" font-wei');
    data.append('ght=\\"600\\" letter-spacing=\\');
    data.append('"0em\\"><tspan x=\\"257\\" y=\\');
    data.append('"256.091\\">63%</tspan></text>');
}

fn svg_lower_text(ref data: Array<felt252>) {
    data.append('<text fill=\\"#D0D1D6\\" fill-o');
    data.append('pacity=\\"0.8\\" xml:space=\\"p');
    data.append('reserve\\" style=\\"white-space');
    data.append(': pre\\" font-family=\\"Inter\\');
    data.append('" font-size=\\"10\\" font-weigh');
    data.append('t=\\"500\\" letter-spacing=\\"0');
    data.append('em\\"><tspan x=\\"24\\" y=\\"31');
    data.append('5.636\\">Surface</tspan></text>');
    data.append('<text fill=\\"#EBECF0\\" xml:sp');
    data.append('ace=\\"preserve\\" style=\\"whi');
    data.append('te-space: pre\\" font-family=\\');
    data.append('"Inter\\" font-size=\\"14\\" fo');
    data.append('nt-weight=\\"bold\\" letter-spa');
    data.append('cing=\\"0em\\"><tspan x=\\"24\\');
    data.append('" y=\\"333.091\\">250m</tspan><');
    data.append('/text><text fill=\\"#EBECF0\\" ');
    data.append('xml:space=\\"preserve\\" style=');
    data.append('\\"white-space: pre\\" font-fam');
    data.append('ily=\\"Inter\\" font-size=\\"14');
    data.append('\\" font-weight=\\"bold\\" lett');
    data.append('er-spacing=\\"0em\\"><tspan x=');
    data.append('\\"64.25\\" y=\\"333.091\\">&#x');
    data.append('b2;</tspan></text><text fill=\\');
    data.append('"#D0D1D6\\" fill-opacity=\\"0.8');
    data.append('\\" xml:space=\\"preserve\\" st');
    data.append('yle=\\"white-space: pre\\" font');
    data.append('-family=\\"Inter\\" font-size=');
    data.append('\\"10\\" font-weight=\\"500\\" ');
    data.append('letter-spacing=\\"0em\\"><tspan');
    data.append(' x=\\"117\\" y=\\"315.636\\">Ty');
    data.append('pe</tspan></text><text fill=\\"');
    data.append('#EFECEA\\" xml:space=\\"preserv');
    data.append('e\\" style=\\"white-space: pre');
    data.append('\\" font-family=\\"Inter\\" fon');
    data.append('t-size=\\"14\\" font-weight=\\"');
    data.append('bold\\" letter-spacing=\\"0em\\');
    data.append('"><tspan x=\\"117\\" y=\\"333.0');
    data.append('91\\">ARR</tspan></text><text f');
    data.append('ill=\\"#D0D1D6\\" fill-opacity=');
    data.append('\\"0.8\\" xml:space=\\"preserve');
    data.append('\\" style=\\"white-space: pre\\');
    data.append('" font-family=\\"Inter\\" font-');
    data.append('size=\\"10\\" font-weight=\\"50');
    data.append('0\\" letter-spacing=\\"0em\\"><');
    data.append('tspan x=\\"186\\" y=\\"315.636');
    data.append('\\">Impact on</tspan></text><te');
    data.append('xt fill=\\"#EFECEA\\" xml:space');
    data.append('=\\"preserve\\" style=\\"white-');
    data.append('space: pre\\" font-family=\\"In');
    data.append('ter\\" font-size=\\"14\\" font-');
    data.append('weight=\\"bold\\" letter-spacin');
    data.append('g=\\"0em\\"><tspan x=\\"181\\" ');
    data.append('y=\\"333.091\\">3 SDG&#x2019;s<');
    data.append('/tspan></text>');
}

// Progress bar
fn svg_progress_bar(ref data: Array<felt252>) {
    data.append('<path d=\\"M179 269h106\\" stro');
    data.append('ke=\\"url(#j)\\" stroke-opacity');
    data.append('=\\"0.3\\" stroke-width=\\"8\\"');
    data.append(' stroke-linecap=\\"round\\"/><p');
    data.append('ath d=\\"M180 269H244\\" stroke');
    data.append('=\\"url(#k)\\" stroke-opacity=');
    data.append('\\"0.8\\" stroke-width=\\"4\\" ');
    data.append('stroke-linecap=\\"round\\"/>');
}

// SDGs images
fn svg_sdgs(ref data: Array<felt252>) {
    data.append('<rect width=\\"30\\" height=\\"');
    data.append('30\\" x=\\"246\\" y=\\"307\\" f');
    data.append('ill=\\"#272727\\" rx=\\"2\\"/><');
    data.append('rect width=\\"30\\" height=\\"3');
    data.append('0\\" x=\\"246\\" y=\\"307\\" fi');
    data.append('ll=\\"url(#l)\\" fill-opacity=');
    data.append('\\".6\\" rx=\\"2\\"/><rect widt');
    data.append('h=\\"30\\" height=\\"30\\" x=\\');
    data.append('"254\\" y=\\"307\\" fill=\\"#27');
    data.append('2727\\" rx=\\"2\\"/><rect width');
    data.append('=\\"30\\" height=\\"30\\" x=\\"');
    data.append('254\\" y=\\"307\\" fill=\\"url(');
    data.append('#m)\\" fill-opacity=\\".6\\" rx');
    data.append('=\\"2\\"/><rect width=\\"30\\" ');
    data.append('height=\\"30\\" x=\\"262\\" y=');
    data.append('\\"307\\" fill=\\"#272727\\" rx');
    data.append('=\\"2\\"/><rect width=\\"30\\" ');
    data.append('height=\\"30\\" x=\\"262\\" y=');
    data.append('\\"307\\" fill=\\"url(#n)\\" fi');
    data.append('ll-opacity=\\".6\\" rx=\\"2\\"/');
    data.append('></g></g>');
}

// Live group
fn svg_status_group(ref data: Array<felt252>) {
    data.append('<g filter=\\"url(#o)\\"><rect x');
    data.append('=\\"246\\" y=\\"20\\" width=\\"');
    data.append('50\\" height=\\"22\\" rx=\\"11');
    data.append('\\" fill=\\"#1F2128\\" fill-opa');
    data.append('city=\\"0.2\\"/><circle cx=\\"2');
    data.append('56\\" cy=\\"31\\" r=\\"3\\" fil');
    data.append('l=\\"#09E1A1\\"/><text fill=\\"');
    data.append('#0AF2AD\\" xml:space=\\"preserv');
    data.append('e\\" style=\\"white-space: pre');
    data.append('\\" font-family=\\"Inter\\" fon');
    data.append('t-size=\\"12\\" font-weight=\\"');
    data.append('500\\" letter-spacing=\\"0em\\"');
    data.append('><tspan x=\\"264.311\\" y=\\"35');
    data.append('.3636\\">Live</tspan></text><re');
    data.append('ct x=\\"246.5\\" y=\\"20.5\\" w');
    data.append('idth=\\"49\\" height=\\"21\\" r');
    data.append('x=\\"10.5\\" stroke=\\"#ABEFC6');
    data.append('\\" stroke-opacity=\\"0.3\\"/><');
    data.append('/g>');
}

// Main text
fn svg_main_text(ref data: Array<felt252>) {
    data.append('<text fill=\\"#EFECEA\\" font-f');
    data.append('amily=\\"Inter\\" font-size=\\"');
    data.append('21\\" font-weight=\\"700\\" lin');
    data.append('e-height=\\"21\\" letter-spacin');
    data.append('g=\\"-0.03em\\" text-align=\\"l');
    data.append('eft\\"><tspan x=\\"20\\" y=\\"1');
    data.append('76.136\\">Banegas Farm</tspan><');
    data.append('/text><text fill=\\"#D0D1D6\\" ');
    data.append('fill-opacity=\\"0.8\\" xml:spac');
    data.append('e=\\"preserve\\" style=\\"white');
    data.append('-space: pre\\" font-family=\\"I');
    data.append('nter\\" font-size=\\"10\\" lett');
    data.append('er-spacing=\\"0em\\"><tspan x=');
    data.append('\\"20.1074\\" y=\\"195.636\\">B');
    data.append('ased in </tspan></text><text fi');
    data.append('ll=\\"#D0D1D6\\" xml:space=\\"p');
    data.append('reserve\\" style=\\"white-space');
    data.append(': pre\\" font-family=\\"Inter\\');
    data.append('" font-size=\\"10\\" font-weigh');
    data.append('t=\\"600\\" letter-spacing=\\"0');
    data.append('em\\"><tspan x=\\"63.3496\\" y=');
    data.append('\\"195.636\\">Costa Rica</tspan');
    data.append('></text><text fill=\\"#D0D1D6\\');
    data.append('" fill-opacity=\\"0.8\\" xml:sp');
    data.append('ace=\\"preserve\\" style=\\"whi');
    data.append('te-space: pre\\" font-family=\\');
    data.append('"Inter\\" font-size=\\"10\\" le');
    data.append('tter-spacing=\\"0em\\"><tspan x');
    data.append('=\\"20\\" y=\\"209.636\\">By </');
    data.append('tspan></text><text fill=\\"#D0D');
    data.append('1D6\\" xml:space=\\"preserve\\"');
    data.append(' style=\\"white-space: pre\\" f');
    data.append('ont-family=\\"Inter\\" font-siz');
    data.append('e=\\"10\\" font-weight=\\"600\\');
    data.append('" letter-spacing=\\"0em\\"><tsp');
    data.append('an x=\\"34.8828\\" y=\\"209.636');
    data.append('\\">Corcovado Foundation</tspan');
    data.append('></text><text fill=\\"#D0D1D6\\');
    data.append('" fill-opacity=\\"0.8\\" xml:sp');
    data.append('ace=\\"preserve\\" style=\\"whi');
    data.append('te-space: pre\\" font-family=\\');
    data.append('"Inter\\" font-size=\\"10\\" le');
    data.append('tter-spacing=\\"0em\\"><tspan x');
    data.append('=\\"204\\" y=\\"195.636\\">Cert');
    data.append('ified by</tspan></text><text fi');
    data.append('ll=\\"#EFECEA\\" xml:space=\\"p');
    data.append('reserve\\" style=\\"white-space');
    data.append(': pre\\" font-family=\\"Inter\\');
    data.append('" font-size=\\"11\\" font-weigh');
    data.append('t=\\"600\\" letter-spacing=\\"0');
    data.append('em\\"><tspan x=\\"239\\" y=\\"2');
    data.append('09.5\\">ERS</tspan></text>');
}

// ERS logo ?
fn svg_certifier_logo(ref data: Array<felt252>) {
    data.append('<rect width=\\"28\\" height=\\"');
    data.append('28\\" x=\\"268\\" y=\\"185\\" f');
    data.append('ill=\\"#EBECF0\\" fill-opacity=');
    data.append('\\".1\\" rx=\\"14\\"/><rect wid');
    data.append('th=\\"14\\" height=\\"14\\" x=');
    data.append('\\"275\\" y=\\"192\\" fill=\\"u');
    data.append('rl(#p)\\" style=\\"mix-blend-mo');
    data.append('de:screen\\"/><rect width=\\"27');
    data.append('\\" height=\\"27\\" x=\\"268.5');
    data.append('\\" y=\\"185.5\\" stroke=\\"#EB');
    data.append('ECF0\\" stroke-dasharray=\\"3 3');
    data.append('\\" stroke-linecap=\\"round\\" ');
    data.append('stroke-miterlimit=\\"1.23\\" st');
    data.append('roke-opacity=\\".7\\" rx=\\"13.');
    data.append('5\\"/>');
}


fn svg_background(ref data: Array<felt252>) {
    data.append('<rect width=\\"312\\" height=\\');
    data.append('"357\\" x=\\"2\\" y=\\"2\\" str');
    data.append('oke=\\"url(#q)\\" stroke-linejo');
    data.append('in=\\"round\\" stroke-opacity=');
    data.append('\\".8\\" stroke-width=\\"4\\" r');
    data.append('x=\\"14\\"/>');
}

fn generate(data: TokenData) -> Span<felt252> {
    let mut svg: Array<felt252> = Default::default();
    svg_header(ref svg);
    svg_styles(ref svg);
    svg.span()
}

// Defs:
fn svg_def_patterns(ref data: Array<felt252>) {
    data.append('<defs><pattern id=\\"c\\" width');
    data.append('=\\"1\\" height=\\"1\\" pattern');
    data.append('ContentUnits=\\"objectBoundingB');
    data.append('ox\\"><use href=\\"#r\\" transf');
    data.append('orm=\\"matrix(.0017 0 0 .00225 ');
    data.append('-.07 0) scale(-1, 1) translate(');
    data.append('-676, 0)\\"/></pattern><pattern');
    data.append(' id=\\"i\\" width=\\"7.01\\" he');
    data.append('ight=\\"36.57\\" patternContent');
    data.append('Units=\\"objectBoundingBox\\"><');
    data.append('use href=\\"#s\\" transform=\\"');
    data.append('scale(.00342 .01786)\\"/></patt');
    data.append('ern><pattern id=\\"l\\" width=');
    data.append('\\"1\\" height=\\"1\\" patternC');
    data.append('ontentUnits=\\"objectBoundingBo');
    data.append('x\\"><use href=\\"#t\\" transfo');
    data.append('rm=\\"scale(.00098)\\"/></patte');
    data.append('rn><pattern id=\\"m\\" width=\\');
    data.append('"1\\" height=\\"1\\" patternCon');
    data.append('tentUnits=\\"objectBoundingBox');
    data.append('\\"><use href=\\"#u\\" transfor');
    data.append('m=\\"scale(.00065)\\"/></patter');
    data.append('n><pattern id=\\"n\\" width=\\"');
    data.append('1\\" height=\\"1\\" patternCont');
    data.append('entUnits=\\"objectBoundingBox\\');
    data.append('"><use href=\\"#v\\" transform=');
    data.append('\\"scale(.00065)\\"/></pattern>');
    data.append('<pattern id=\\"p\\" width=\\"1');
    data.append('\\" height=\\"1\\" patternConte');
    data.append('ntUnits=\\"objectBoundingBox\\"');
    data.append('><use href=\\"#w\\" transform=');
    data.append('\\"translate(.08) scale(.0032)');
    data.append('\\"/></pattern>');
}

// filters
fn svg_def_filters(ref data: Array<felt252>) {
    data.append('<filter id=\\"a\\" width=\\"310');
    data.append('\\" height=\\"355\\" x=\\"3\\" ');
    data.append('y=\\"3\\" color-interpolation-f');
    data.append('ilters=\\"sRGB\\" filterUnits=');
    data.append('\\"userSpaceOnUse\\"><feFlood f');
    data.append('lood-opacity=\\"0\\" result=\\"');
    data.append('BackgroundImageFix\\"/><feColor');
    data.append('Matrix in=\\"SourceAlpha\\" res');
    data.append('ult=\\"hardAlpha\\" values=\\"0');
    data.append(' 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ');
    data.append('0 0 127 0\\"/><feMorphology in=');
    data.append('\\"SourceAlpha\\" operator=\\"d');
    data.append('ilate\\" radius=\\"1\\" result=');
    data.append('\\"effect1_dropShadow_2951_1923');
    data.append('38\\"/><feOffset /><feColorMatr');
    data.append('ix values=\\"0 0 0 0 0.321569 0');
    data.append(' 0 0 0 0.337255 0 0 0 0 0.38039');
    data.append('2 0 0 0 0.4 0\\"/><feBlend in2=');
    data.append('\\"BackgroundImageFix\\" result');
    data.append('=\\"effect1_dropShadow_2951_192');
    data.append('338\\"/><feBlend in=\\"SourceGr');
    data.append('aphic\\" in2=\\"effect1_dropSha');
    data.append('dow_2951_192338\\" result=\\"sh');
    data.append('ape\\"/></filter><filter id=\\"');
    data.append('e\\" width=\\"316\\" height=\\"');
    data.append('364\\" x=\\"0\\" y=\\"0\\" colo');
    data.append('r-interpolation-filters=\\"sRGB');
    data.append('\\" filterUnits=\\"userSpaceOnU');
    data.append('se\\"><feFlood flood-opacity=\\');
    data.append('"0\\" result=\\"BackgroundImage');
    data.append('Fix\\"/><feGaussianBlur in=\\"B');
    data.append('ackgroundImageFix\\" stdDeviati');
    data.append('on=\\"2\\"/><feComposite in2=\\');
    data.append('"SourceAlpha\\" operator=\\"in');
    data.append('\\" result=\\"effect1_backgroun');
    data.append('dBlur_2951_192338\\"/><feBlend ');
    data.append('in=\\"SourceGraphic\\" in2=\\"e');
    data.append('ffect1_backgroundBlur_2951_1923');
    data.append('38\\" result=\\"shape\\"/></fil');
    data.append('ter><filter id=\\"g\\" width=\\');
    data.append('"332\\" height=\\"234\\" x=\\"-');
    data.append('8\\" y=\\"137\\" color-interpol');
    data.append('ation-filters=\\"sRGB\\" filter');
    data.append('Units=\\"userSpaceOnUse\\"><feF');
    data.append('lood flood-opacity=\\"0\\" resu');
    data.append('lt=\\"BackgroundImageFix\\"/><f');
    data.append('eGaussianBlur in=\\"BackgroundI');
    data.append('mageFix\\" stdDeviation=\\"6\\"');
    data.append('/><feComposite in2=\\"SourceAlp');
    data.append('ha\\" operator=\\"in\\" result=');
    data.append('\\"effect1_backgroundBlur_2951_');
    data.append('192338\\"/><feColorMatrix in=\\');
    data.append('"SourceAlpha\\" result=\\"hardA');
    data.append('lpha\\" values=\\"0 0 0 0 0 0 0');
    data.append(' 0 0 0 0 0 0 0 0 0 0 0 127 0\\"');
    data.append('/><feOffset dy=\\"8\\"/><feGaus');
    data.append('sianBlur stdDeviation=\\"3\\"/>');
    data.append('<feComposite in2=\\"hardAlpha\\');
    data.append('" operator=\\"out\\"/><feColorM');
    data.append('atrix values=\\"0 0 0 0 0 0 0 0');
    data.append(' 0 0 0 0 0 0 0 0 0 0 0.05 0\\"/');
    data.append('><feBlend in2=\\"effect1_backgr');
    data.append('oundBlur_2951_192338\\" result=');
    data.append('\\"effect2_dropShadow_2951_1923');
    data.append('38\\"/><feBlend in=\\"SourceGra');
    data.append('phic\\" in2=\\"effect2_dropShad');
    data.append('ow_2951_192338\\" result=\\"sha');
    data.append('pe\\"/><feColorMatrix in=\\"Sou');
    data.append('rceAlpha\\" result=\\"hardAlpha');
    data.append('\\" values=\\"0 0 0 0 0 0 0 0 0');
    data.append(' 0 0 0 0 0 0 0 0 0 127 0\\"/><f');
    data.append('eOffset dy=\\"2\\"/><feGaussian');
    data.append('Blur stdDeviation=\\"4\\"/><feC');
    data.append('omposite in2=\\"hardAlpha\\" k2');
    data.append('=\\"-1\\" k3=\\"1\\" operator=');
    data.append('\\"arithmetic\\"/><feColorMatri');
    data.append('x values=\\"0 0 0 0 1 0 0 0 0 1');
    data.append(' 0 0 0 0 1 0 0 0 0.25 0\\"/><fe');
    data.append('Blend in2=\\"shape\\" result=\\');
    data.append('"effect3_innerShadow_2951_19233');
    data.append('8\\"/></filter><filter id=\\"h');
    data.append('\\" width=\\"328\\" height=\\"9');
    data.append('2\\" x=\\"-6\\" y=\\"213\\" col');
    data.append('or-interpolation-filters=\\"sRG');
    data.append('B\\" filterUnits=\\"userSpaceOn');
    data.append('Use\\"><feFlood flood-opacity=');
    data.append('\\"0\\" result=\\"BackgroundIma');
    data.append('geFix\\"/><feGaussianBlur in=\\');
    data.append('"BackgroundImageFix\\" stdDevia');
    data.append('tion=\\"9\\"/><feComposite in2=');
    data.append('\\"SourceAlpha\\" operator=\\"i');
    data.append('n\\" result=\\"effect1_backgrou');
    data.append('ndBlur_2951_192338\\"/><feColor');
    data.append('Matrix in=\\"SourceAlpha\\" res');
    data.append('ult=\\"hardAlpha\\" values=\\"0');
    data.append(' 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ');
    data.append('0 0 127 0\\"/><feOffset dy=\\"8');
    data.append('\\"/><feGaussianBlur stdDeviati');
    data.append('on=\\"3\\"/><feComposite in2=\\');
    data.append('"hardAlpha\\" operator=\\"out\\');
    data.append('"/><feColorMatrix values=\\"0 0');
    data.append(' 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ');
    data.append('0 0.05 0\\"/><feBlend in2=\\"ef');
    data.append('fect1_backgroundBlur_2951_19233');
    data.append('8\\" result=\\"effect2_dropShad');
    data.append('ow_2951_192338\\"/><feBlend in=');
    data.append('\\"SourceGraphic\\" in2=\\"effe');
    data.append('ct2_dropShadow_2951_192338\\" r');
    data.append('esult=\\"shape\\"/><feColorMatr');
    data.append('ix in=\\"SourceAlpha\\" result=');
    data.append('\\"hardAlpha\\" values=\\"0 0 0');
    data.append(' 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ');
    data.append('127 0\\"/><feOffset dy=\\"1\\"/');
    data.append('><feGaussianBlur stdDeviation=');
    data.append('\\"3.5\\"/><feComposite in2=\\"');
    data.append('hardAlpha\\" k2=\\"-1\\" k3=\\"');
    data.append('1\\" operator=\\"arithmetic\\"/');
    data.append('><feColorMatrix values=\\"0 0 0');
    data.append(' 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 ');
    data.append('0.25 0\\"/><feBlend in2=\\"shap');
    data.append('e\\" result=\\"effect3_innerSha');
    data.append('dow_2951_192338\\"/></filter><f');
    data.append('ilter id=\\"o\\" width=\\"90\\"');
    data.append(' height=\\"62\\" x=\\"226\\" y=');
    data.append('\\"0\\" color-interpolation-fil');
    data.append('ters=\\"sRGB\\" filterUnits=\\"');
    data.append('userSpaceOnUse\\"><feFlood floo');
    data.append('d-opacity=\\"0\\" result=\\"Bac');
    data.append('kgroundImageFix\\"/><feGaussian');
    data.append('Blur in=\\"BackgroundImageFix\\');
    data.append('" stdDeviation=\\"10\\"/><feCom');
    data.append('posite in2=\\"SourceAlpha\\" op');
    data.append('erator=\\"in\\" result=\\"effec');
    data.append('t1_backgroundBlur_2951_192338\\');
    data.append('"/><feBlend in=\\"SourceGraphic');
    data.append('\\" in2=\\"effect1_backgroundBl');
    data.append('ur_2951_192338\\" result=\\"sha');
    data.append('pe\\"/></filter><linearGradient');
    data.append(' id=\\"d\\" x1=\\"141.39\\" x2=');
    data.append('\\"140.76\\" y1=\\"119.5\\" y2=');
    data.append('\\"356\\" gradientUnits=\\"user');
    data.append('SpaceOnUse\\"><stop stop-color=');
    data.append('\\"#0B0D13\\" stop-opacity=\\".');
    data.append('4\\"/><stop offset=\\"1\\" stop');
    data.append('-color=\\"#0B0D13\\" stop-opaci');
    data.append('ty=\\".9\\"/></linearGradient><');
    data.append('linearGradient id=\\"f\\" x1=\\');
    data.append('"158\\" x2=\\"158\\" y1=\\"4\\"');
    data.append(' y2=\\"360\\" gradientUnits=\\"');
    data.append('userSpaceOnUse\\"><stop offset=');
    data.append('\\".41\\" stop-color=\\"#D9D9D9');
    data.append('\\" stop-opacity=\\"0\\"/><stop');
    data.append(' offset=\\"1\\" stop-color=\\"#');
    data.append('D9D9D9\\" stop-opacity=\\".01\\');
    data.append('"/></linearGradient><linearGrad');
    data.append('ient id=\\"j\\" x1=\\"285\\" x2');
    data.append('=\\"179\\" y1=\\"270\\" y2=\\"2');
    data.append('70\\" gradientUnits=\\"userSpac');
    data.append('eOnUse\\"><stop offset=\\".4\\"');
    data.append(' stop-color=\\"#A8C4EF\\"/><sto');
    data.append('p offset=\\"1\\" stop-color=\\"');
    data.append('#0AF2AD\\"/></linearGradient><l');
    data.append('inearGradient id=\\"k\\" x1=\\"');
    data.append('244\\" x2=\\"180\\" y1=\\"270\\');
    data.append('" y2=\\"270\\" gradientUnits=\\');
    data.append('"userSpaceOnUse\\"><stop offset');
    data.append('=\\".4\\" stop-color=\\"#A8C4EF');
    data.append('\\"/><stop offset=\\"1\\" stop-');
    data.append('color=\\"#0AF2AD\\"/></linearGr');
    data.append('adient><radialGradient id=\\"q');
    data.append('\\" cx=\\"0\\" cy=\\"0\\" r=\\"');
    data.append('1\\" gradientTransform=\\"matri');
    data.append('x(277.26268 -279.7368 989.4931 ');
    data.append('980.74152 101.47 200.84)\\" gra');
    data.append('dientUnits=\\"userSpaceOnUse\\"');
    data.append('><stop offset=\\".02\\" stop-co');
    data.append('lor=\\"#E8E7E7\\"/><stop offset');
    data.append('=\\".06\\" stop-color=\\"#BAD3C');
    data.append('B\\"/><stop offset=\\".38\\" st');
    data.append('op-color=\\"#0AF2AD\\"/><stop o');
    data.append('ffset=\\".4\\" stop-color=\\"#2');
    data.append('7EABA\\"/><stop offset=\\".56\\');
    data.append('" stop-color=\\"#C3C2FF\\"/><st');
    data.append('op offset=\\".75\\" stop-color=');
    data.append('\\"#FFFCFC\\"/><stop offset=\\"');
    data.append('.88\\" stop-color=\\"#E8E3E3\\"');
    data.append('/><stop offset=\\"1\\" stop-col');
    data.append('or=\\"#B3B3B3\\"/></radialGradi');
    data.append('ent><clipPath id=\\"b\\"><rect ');
    data.append('width=\\"308\\" height=\\"353\\');
    data.append('" x=\\"4\\" y=\\"4\\" fill=\\"#');
    data.append('fff\\" rx=\\"12\\"/></clipPath>');
}

// + b64 JPEG images
fn svg_background_image(ref data: Array<felt252>) {
    data.append('<image id=\\"image0\\" width=\\');
    data.append('"673\\" height=\\"444\\" xlink:');
    data.append('href=\\"data:image/jpeg;base64,');
// Insert background image from provider here
}

fn svg_end(ref data: Array<felt252>) {
    data.append('</defs></svg>');
}

