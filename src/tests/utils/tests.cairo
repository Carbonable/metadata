use array::SpanTrait;
use debug::PrintTrait;

fn print_felt_span(a: Span<felt252>) {
    let mut a = a;
    match a.pop_front() {
        Option::Some(value) => {
            (*value).print();
            print_felt_span(a);
        },
        Option::None(()) => {}
    }
}
