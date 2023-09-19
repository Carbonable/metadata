#[starknet::interface]
trait IContractDescriptor<T> {
    fn construct_contract_uri(self: @T) -> Span<felt252>;
}
