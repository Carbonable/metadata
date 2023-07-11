// TODO
// Get data from contract
// Generate SVG from template

use starknet::get_contract_address;

fn generate_contract_uri(data: felt252) -> Array<felt252> {
    let contract = get_contract_address();
    Default::default()
}
