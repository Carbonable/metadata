// TODO
// Get data from contract
// Generate SVG from template

use starknet::get_contract_address;
use metadata::metadata::project::data;

fn generate_contract_uri(data: felt252) -> Array<felt252> {
    // let contract = get_contract_address();
    let mut uri = Default::default();

    data::DescriptionData::add_description(ref uri);
    uri
}

