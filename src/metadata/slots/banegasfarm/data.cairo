use array::ArrayTrait;

use metadata::metadata::common::models::{ProjectStaticData, String, Shortstring};

const NAME: Shortstring = 'Banegas Farm';
const DEVELOPER: Shortstring = 'Corcovado Foundation';
const CERTIFIER: Shortstring = 'ERS';
const AREA: u32 = 25;
const COUNTRY: Shortstring = 'Costa Rica';
const END_YEAR: u32 = 2052; // get from project
const END_MONTH: u8 = 12; // get from project
const DURATION_IN_YEARS: u32 = 30; // get from project
const PROJECTED_CU: u128 = 1573; // get from project
const COLOR: Shortstring = 'Green';
const TYPE: Shortstring = 'ARR';
const CATEGORY: Shortstring = 'Regeneration';
const SOURCE: Shortstring = 'Carbonable';

#[inline(always)]
fn get_sdgs_() -> Span<u8> {
    //array![13, 14, 15].span()
    array![4, 9, 10, 13, 14, 15].span()
// array![].span()
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
        projected_cu: PROJECTED_CU,
        color: array![COLOR].span(),
        type_: array![TYPE].span(),
        category: array![CATEGORY].span(),
        source: array![SOURCE].span(),
        sdgs: get_sdgs_(),
        certifier_component: 'ERS.svg',
        background_component: 'Farmer.jpeg.b64'
    }
}

#[inline(always)]
fn get_description_() -> Span<felt252> {
    let mut data = Default::default();
    add_description_(ref data);
    data.span()
}

#[inline(always)]
fn add_description_(ref data: Array<felt252>) {
    data.append('TODO: Add description');
}

