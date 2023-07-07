mod ProjectData {
    const NAME: felt252 = 'Banegas Farm';
    const DEVELOPER: felt252 = 'Corcovado Foundation';
    const CERTIFIER: felt252 = 'Wildsense';
    const AREA: felt252 = 25;
    const COUNTRY: felt252 = 'Costa Rica';
    const END_YEAR: felt252 = 2052; // mutable storage?
    const END_MONTH: felt252 = 12; // mutable storage?
    const DURATION_IN_YEARS: felt252 = 30; // 2052 - 2022;
    const PROJECTED_CU: felt252 = 1573;
    const COLOR: felt252 = 'Green';
    const TYPE: felt252 = 'Forest';
    const CATEGORY: felt252 = 'Regeneration';
    const STATUS: felt252 = 'Active'; // mutable storage?
    const SOURCE: felt252 = 'Carbonable';
}

mod AssetData {}

fn fetch_slot_data(slot: u256) -> felt252 {
    1
}
