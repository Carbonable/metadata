use starknet::ContractAddress;
use metadata::metadata::common::models::ProjectStaticData;

#[inline(always)]
fn generate_slot_uri(
    contract_address: ContractAddress, slot: u256, static_data: ProjectStaticData
) -> Span<felt252> {
    let mut uri: Array<felt252> = Default::default();
    uri.append('https://');
    uri.append('www.');
    uri.append('example.com/');

    uri.span()
}
