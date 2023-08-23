const NAME: felt252 = 'Carbonable_Logo.svg';
#[starknet::contract]
mod Component {
    use array::ArrayTrait;
    use metadata::interfaces::component::IComponent;

    #[storage]
    struct Storage {}

    #[external(v0)]
    impl ComponentImpl of IComponent<ContractState> {
        fn name(self: @ContractState) -> felt252 {
            super::NAME
        }

        fn concat(self: @ContractState, mut data: Array<felt252>) -> Array<felt252> {
            data.append('<svg width=\\"1080\\" height=\\');
            data.append('"1080\\" viewBox=\\"0 0 1080 10');
            data.append('80\\" fill=\\"none\\" xmlns=\\"');
            data.append('http://www.w3.org/2000/svg\\"> ');
            data.append('<rect width=\\"1080\\" height=');
            data.append('\\"1080\\" fill=\\"white\\" /> ');
            data.append('<path fill-rule=\\"evenodd\\" c');
            data.append('lip-rule=\\"evenodd\\" d=\\"M51');
            data.append('1.843 487.724C467.052 546.797 4');
            data.append('39.609 585.256 439.609 629.804C');
            data.append('439.609 685.251 484.707 730.37 ');
            data.append('540.154 730.391C595.601 730.37 ');
            data.append('640.699 685.251 640.699 629.804');
            data.append('C640.699 585.256 613.245 546.78');
            data.append('6 568.464 487.724L568.102 487.2');
            data.append('46C559.142 475.425 549.807 463.');
            data.append('109 540.492 450.195H539.817C530');
            data.append('.376 437.108 520.926 424.634 51');
            data.append('1.845 412.667C467.053 353.604 4');
            data.append('39.61 315.135 439.61 270.587C43');
            data.append('9.61 243.725 450.076 218.459 46');
            data.append('9.073 199.462C488.059 180.476 5');
            data.append('13.304 169.999 540.155 169.999C');
            data.append('567.006 170.01 592.251 180.476 ');
            data.append('611.237 199.462C630.234 218.459');
            data.append(' 640.7 243.714 640.7 270.587C64');
            data.append('0.7 315.135 613.246 353.604 568');
            data.append('.465 412.667L568.103 413.144C55');
            data.append('9.144 424.965 549.808 437.282 5');
            data.append('40.493 450.195H762.387C769.237 ');
            data.append('460.925 775.791 471.983 781.88 ');
            data.append('483.485C807.738 532.346 820.308');
            data.append(' 580.203 820.308 629.804C820.30');
            data.append('8 667.597 812.886 704.301 798.2');
            data.append('56 738.901C784.132 772.275 763.');
            data.append('941 802.235 738.242 827.934C712');
            data.append('.542 853.644 682.583 873.835 64');
            data.append('9.209 887.948C614.63 902.568 57');
            data.append('7.957 909.989 540.196 910H540.1');
            data.append('22C502.361 909.989 465.678 902.');
            data.append('568 431.099 887.948C397.725 873');
            data.append('.825 367.765 853.633 342.066 82');
            data.append('7.934C316.356 802.235 296.165 7');
            data.append('72.275 282.052 738.901C267.421 ');
            data.append('704.29 260 667.586 260 629.804C');
            data.append('260 580.203 272.569 532.346 298');
            data.append('.427 483.485C304.516 471.993 31');
            data.append('1.071 460.925 317.921 450.195H5');
            data.append('39.816C530.375 463.283 520.924 ');
            data.append('475.757 511.843 487.724Z\\" fil');
            data.append('l=\\"url(#grad)\\" /> <defs> <l');
            data.append('inearGradient id=\\"grad\\" x1=');
            data.append('\\"820.132\\" y1=\\"169.999\\" ');
            data.append('x2=\\"820.132\\" y2=\\"910\\" g');
            data.append('radientUnits=\\"userSpaceOnUse');
            data.append('\\"> <stop offset=\\"0.177366\\');
            data.append('" stop-color=\\"#0AF2AD\\" /> <');
            data.append('stop offset=\\"0.822634\\" stop');
            data.append('-color=\\"#A8C4EF\\" /> </linea');
            data.append('rGradient> </defs></svg>');

            data
        }

        fn get(self: @ContractState) -> Array<felt252> {
            let mut test = ArrayTrait::<felt252>::new();
            self.concat(test)
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

    #[test]
    #[available_gas(20000)]
    fn test_component_name() {
        let data: Span<felt252> = Component::__external::name(Default::default().span());
        let name: felt252 = *data[0];
        assert_eq(@name, @super::NAME, 'Couldn\'t get name');
    }

    #[test]
    #[available_gas(400000)]
    fn test_component_get() {
        let data: Span<felt252> = Component::__external::get(Default::default().span());
        assert_eq(@data.len(), @61_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
