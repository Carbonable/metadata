use metadata::metadata::common::models::{ProjectStaticData, String, Shortstring};

const NAME: Shortstring = 'Lorem Ipsum';
const DEVELOPER: Shortstring = 'Dolor Sit Amet';
const CERTIFIER: Shortstring = 'Consectetur';
const AREA: u32 = 911;
const COUNTRY: Shortstring = 'Adipiscing';
const END_YEAR: u32 = 4337; // get from project
const END_MONTH: u8 = 12; // get from project
const DURATION_IN_YEARS: u32 = consteval_int!(4337 - 2022); // get from project
const TOTAL_CU: u64 = 9999; // get from project
const PROJECTED_CU: u64 = 9999; // get from project
const COLOR: Shortstring = 'Transparent';
const TYPE: Shortstring = 'XXX';
const CATEGORY: Shortstring = 'Category';
const SOURCE: Shortstring = 'Testing';
const PAUSED: u8 = 1;

#[inline(always)]
fn get_sdgs_() -> Span<u8> {
    array![1, 2, 3, 4, 5, 6, 7, 8, 9, 10].span()
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
        background_component: 'bg.water.jpg.b64',
        external_url: get_external_url_(),
        paused: PAUSED,
    }
}

#[inline(always)]
fn get_external_url_() -> Span<felt252> {
    array!['https://app.carbonable.io/', 'launchpad/'].span()
}

#[inline(always)]
fn get_description_() -> Span<felt252> {
    let mut data = Default::default();
    add_description_(ref data);
    data.span()
}

#[inline(always)]
fn add_description_(ref data: Array<felt252>) {
    data.append('Test Description');
    data.append('Lorem ipsum');
    data.append('Dolor sit amet');
    data.append('Consectetur');
    data.append('Adipiscing');
    data.append('Elit');
}

