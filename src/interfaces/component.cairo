// #[starknet::interface]
// trait IComponent<TContractState> {
//     fn name(self: @TContractState) -> felt252;
//     // Get with params?
//     // fn get(self: @TContractState, params: Span<felt252>) -> u256;
//     fn get(ref self: TContractState) -> Span<felt252>;
//     fn concat(ref self: TContractState, data: Array<felt252>) -> Array<felt252>;
// // func concat(uri_len: felt, uri_ptr: felt*) -> (uri_len: felt, uri_ptr: felt*);
// }

#[starknet::interface]
trait IComponent<TContractState> {
    fn name(self: @TContractState) -> felt252;
    // Get with params?
    // fn get(self: @TContractState, params: Span<felt252>) -> u256;
    fn get(self: @TContractState) -> Span<felt252>;
    fn concat(self: @TContractState, data: Array<felt252>) -> Array<felt252>;
// func concat(uri_len: felt, uri_ptr: felt*) -> (uri_len: felt, uri_ptr: felt*);
}
