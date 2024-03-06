use metadata::metadata::common::models::{ProjectStaticData, String, Shortstring};

const NAME: Shortstring = 'Karathuru';
const DEVELOPER: Shortstring = 'Wordview Intl Foundation';
const CERTIFIER: Shortstring = 'Verra';
const AREA: u32 = 500;
const COUNTRY: Shortstring = 'Myanmar';
const END_YEAR: u32 = 2047; // get from project
const END_MONTH: u8 = 12; // get from project
const DURATION_IN_YEARS: u32 = consteval_int!(2047 - 2024); // get from project
const TOTAL_CU: u64 = 410400; // get from project
const PROJECTED_CU: u64 = 410400; // get from project
const COLOR: Shortstring = 'Blue';
const TYPE: Shortstring = 'ARR';
const CATEGORY: Shortstring = 'Mangrove';
const SOURCE: Shortstring = 'Carbonable';

#[inline(always)]
fn get_sdgs_() -> Span<u8> {
    array![4, 5, 8, 13, 14, 15].span()
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
        background_component: 'bg.Karathuru.jpg.b64',
        external_url: get_external_url_(),
    }
}

#[inline(always)]
fn get_external_url_() -> Span<felt252> {
    array!['https://app.carbonable.io/', 'launchpad/', 'mangroves-regeneration-', 'karathuru']
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
    data.append('The project involves the ');
    data.append('regeneration of 228 ha in 2023');
    data.append(' with the planting of 570,000 ');
    data.append('trees (2,500 per  ha), and the ');
    data.append('restoration of a carbon sink t');
    data.append('hat will result in a forecasted');
    data.append(' amount of 374,285 certified ');
    data.append('carbon units amongst which ');
    data.append('187,142 Carbon Units will be ');
    data.append('reserved for investors and the ');
    data.append('other half to local communities');
}

