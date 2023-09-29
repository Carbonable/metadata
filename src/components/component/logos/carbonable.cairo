const NAME: felt252 = 'Carbonable.svg';

#[starknet::contract]
mod Component {
    use array::ArrayTrait;
    use metadata::interfaces::component::IComponent;
    use metadata::components::configs::svg;

    #[storage]
    struct Storage {}

    #[external(v0)]
    impl ComponentImpl of IComponent<ContractState> {
        fn name(self: @ContractState) -> felt252 {
            super::NAME
        }

        fn render(self: @ContractState, args: Option<Span<felt252>>) -> Array<felt252> {
            let props: svg::Properties = svg::parse_properties(args);

            let mut data: Array<felt252> = Default::default();
            svg::add_header_helper(props, ref data);

            data.append(' viewBox=\\"0 0 1080 1080\\" fil');
            data.append('l=\\"none\\" xmlns=\\"http://ww');
            data.append('w.w3.org/2000/svg\\"><rect widt');
            data.append('h=\\"1080\\" height=\\"1080\\"');
            data.append(' fill=\\"white\\"/><path fill-r');
            data.append('ule=\\"evenodd\\" clip-rule=\\"');
            data.append('evenodd\\" d=\\"M511.843 487.72');
            data.append('4C467.052 546.797 439.609 585.2');
            data.append('56 439.609 629.804C439.609 685.');
            data.append('251 484.707 730.37 540.154 730.');
            data.append('391C595.601 730.37 640.699 685.');
            data.append('251 640.699 629.804C640.699 585');
            data.append('.256 613.245 546.786 568.464 48');
            data.append('7.724L568.102 487.246C559.142 4');
            data.append('75.425 549.807 463.109 540.492');
            data.append(' 450.195H539.817C530.376 437.10');
            data.append('8 520.926 424.634 511.845 412.6');
            data.append('67C467.053 353.604 439.61 315.1');
            data.append('35 439.61 270.587C439.61 243.72');
            data.append('5 450.076 218.459 469.073 199.4');
            data.append('62C488.059 180.476 513.304 169.');
            data.append('999 540.155 169.999C567.006 170');
            data.append('.01 592.251 180.476 611.237 199');
            data.append('.462C630.234 218.459 640.7 243.');
            data.append('714 640.7 270.587C640.7 315.135');
            data.append(' 613.246 353.604 568.465 412.66');
            data.append('7L568.103 413.144C559.144 424.9');
            data.append('65 549.808 437.282 540.493 450.');
            data.append('195H762.387C769.237 460.925 775');
            data.append('.791 471.983 781.88 483.485C807');
            data.append('.738 532.346 820.308 580.203 82');
            data.append('0.308 629.804C820.308 667.597 8');
            data.append('12.886 704.301 798.256 738.901C');
            data.append('784.132 772.275 763.941 802.235');
            data.append(' 738.242 827.934C712.542 853.64');
            data.append('4 682.583 873.835 649.209 887.9');
            data.append('48C614.63 902.568 577.957 909.9');
            data.append('89 540.196 910H540.122C502.361');
            data.append(' 909.989 465.678 902.568 431.09');
            data.append('9 887.948C397.725 873.825 367.7');
            data.append('65 853.633 342.066 827.934C316.');
            data.append('356 802.235 296.165 772.275 282');
            data.append('.052 738.901C267.421 704.29 260');
            data.append(' 667.586 260 629.804C260 580.20');
            data.append('3 272.569 532.346 298.427 483.4');
            data.append('85C304.516 471.993 311.071 460.');
            data.append('925 317.921 450.195H539.816C530');
            data.append('.375 463.283 520.924 475.757 51');
            data.append('1.843 487.724Z\\" fill=\\"url(#');
            data.append('grad)\\"/><defs><linearGradient');
            data.append(' id=\\"grad\\" x1=\\"820.132\\"');
            data.append(' y1=\\"169.999\\" x2=\\"820.132');
            data.append('\\" y2=\\"910\\" gradientUnits=');
            data.append('\\"userSpaceOnUse\\"><stop offs');
            data.append('et=\\"0.177366\\" stop-color=\\');
            data.append('"#0AF2AD\\"/><stop offset=\\"0.');
            data.append('822634\\" stop-color=\\"#A8C4EF');
            data.append('\\"/></linearGradient></defs></');
            data.append('svg>');

            data
        }
    }
}

#[cfg(test)]
mod test {
    use array::{ArrayTrait, SpanTrait};
    use debug::PrintTrait;
    use traits::Into;

    use test::test_utils::assert_eq;

    use super::Component;
    use metadata::components::configs::svg;

    #[test]
    #[available_gas(15_000)]
    fn test_component_name() {
        let data: Span<felt252> = Component::__external::name(Default::default().span());
        let name: felt252 = *data[0];
        assert_eq(@name, @super::NAME, 'Couldn\'t get name');
    }

    #[test]
    #[available_gas(1427000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @61_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
