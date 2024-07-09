use metadata::metadata::common::models::{ProjectStaticData, String, Shortstring};

const NAME: Shortstring = 'Las Delicias';
const DEVELOPER: Shortstring = 'Fundacion Naturaleza Panama';
const CERTIFIER: Shortstring = 'Wildsense';
const AREA: u32 = 18;
const COUNTRY: Shortstring = 'Panama';
const END_YEAR: u32 = 2042; // get from project
const END_MONTH: u8 = 12; // get from project
const DURATION_IN_YEARS: u32 = consteval_int!(2042 - 2022); // get from project
const TOTAL_CU: u64 = 3603; // get from project
const PROJECTED_CU: u64 = 3603; // get from project
const COLOR: Shortstring = 'Blue';
const TYPE: Shortstring = 'ARR';
const CATEGORY: Shortstring = 'Mangrove';
const SOURCE: Shortstring = 'Carbonable';
const PAUSED: u8 = 0;

#[inline(always)]
fn get_sdgs_() -> Span<u8> {
    array![8, 13, 14, 15].span()
}

#[inline(always)]
fn get_static_data() -> ProjectStaticData {
    ProjectStaticData {
        name: array![NAME].span(),
        description: get_description_(),
        developer: array![DEVELOPER].span(),
        certifier: array![CERTIFIER].span(),
        area: AREA,
        country: array![COUNTRY].span(),
        end_year: END_YEAR,
        end_month: END_MONTH,
        duration_in_years: DURATION_IN_YEARS,
        total_cu: TOTAL_CU,
        projected_cu: PROJECTED_CU,
        color: array![COLOR].span(),
        type_: array![TYPE].span(),
        category: array![CATEGORY].span(),
        source: array![SOURCE].span(),
        sdgs: get_sdgs_(),
        background_component: 'bg.LasDelicias.jpg.b64',
        external_url: get_external_url_(),
        paused: PAUSED,
    }
}

#[inline(always)]
fn get_external_url_() -> Span<felt252> {
    array![
        'https://app.carbonable.io/', 'launchpad/', 'mangroves-regeneration-', 'las-delicias-panama'
    ]
        .span()
}

#[inline(always)]
fn get_description_() -> Span<felt252> {
    let mut data = Default::default();
    add_description_(ref data);
    data.span()
}

#[inline(always)]
fn add_description_(ref data: Array<felt252>) {
    data.append('Carbonable\'s Las Delicias NFTs');
    data.append(': Dive into Nature\'s VIP Club!');
    data.append(' Unlock a world of green and bl');
    data.append('ue with Panama\'s mangrove rest');
    data.append('orers! By securing an NFT, you');
    data.append('\'re not only backing an eco-mi');
    data.append('ssion, but you\'re also claimin');
    data.append('g prime carbon credits. Stay ah');
    data.append('ead, make waves, and grab yours');
    data.append(' now. Nature\'s red carpet is r');
    data.append('olling out!');
}

