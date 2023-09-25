use starknet::ContractAddress;

#[starknet::interface]
trait IAbsorber<TState> {
    fn get_start_time(self: @TState, slot: u256) -> u64;
    fn get_final_time(self: @TState, slot: u256) -> u64;
    fn get_times(self: @TState, slot: u256) -> Span<u64>;
    fn get_absorptions(self: @TState, slot: u256) -> Span<u64>;
    fn get_absorption(self: @TState, slot: u256, time: u64) -> u64;
    fn get_current_absorption(self: @TState, slot: u256) -> u64;
    fn get_final_absorption(self: @TState, slot: u256) -> u64;
    fn get_project_value(self: @TState, slot: u256) -> u256;
    fn get_ton_equivalent(self: @TState, slot: u256) -> u64;
    fn is_setup(self: @TState, slot: u256) -> bool;
    fn set_absorptions(
        ref self: TState, slot: u256, times: Span<u64>, absorptions: Span<u64>, ton_equivalent: u64
    );
    fn set_project_value(ref self: TState, slot: u256, project_value: u256);
}
