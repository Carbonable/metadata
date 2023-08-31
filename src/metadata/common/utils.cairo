use array::{ArrayTrait, SpanTrait};
use alexandria_ascii::interger::ToAsciiTrait;

trait ToSpanOption {
    fn to_span(self: felt252) -> Option<Span<felt252>>;
}

impl ToSpanOptionImpl of ToSpanOption {
    #[inline(always)]
    fn to_span(self: felt252) -> Option<Span<felt252>> {
        Option::Some(array![self].span())
    }
}

trait ArrayConcat<T> {
    fn concat(ref self: Array<T>, data: Span<T>);
}

impl ArrayConcatTrait<T, impl TCopy: Copy<T>, impl TDrop: Drop<T>> of ArrayConcat<T> {
    fn concat(ref self: Array<T>, data: Span<T>) {
        let mut data = data;
        loop {
            match data.pop_front() {
                Option::Some(v) => {
                    self.append(*v);
                },
                Option::None(_) => {
                    break ();
                },
            };
        };
    }
}
