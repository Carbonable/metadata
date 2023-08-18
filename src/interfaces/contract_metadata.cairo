use starknet::ContractAddress;

#[starknet::interface]
trait IContractMetadata<TContractState> {
    fn construct_contract_uri(self: @TContractState) -> Span<felt252>;
}
