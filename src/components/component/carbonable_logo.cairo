#[starknet::contract]
mod CarbonableLogo {
    use array::ArrayTrait;
    use metadata::interfaces::component::IComponent;

    #[storage]
    struct Storage {}

    #[external(v0)]
    impl ComponentImpl of IComponent<ContractState> {
        fn name(self: @ContractState) -> felt252 {
            'Carbonable Logo'
        }

        fn concat(self: @ContractState, mut data: Array<felt252>) -> Array<felt252> {
            data.append('<svg width=\"1080\" height=\"10');
            data.append('80\" viewBox=\"0 0 1080 1080\" ');
            data.append('fill=\"none\" xmlns=\"http://ww');
            data.append('w.w3.org/2000/svg\"> <rect widt');
            data.append('h=\"1080\" height=\"1080\" fill');
            data.append('=\"white\" /> <path fill-rule=');
            data.append('\"evenodd\" clip-rule=\"evenodd');
            data.append('\" d=\"M511.843 487.724C467.052');
            data.append(' 546.797 439.609 585.256 439.60');
            data.append('9 629.804C439.609 685.251 484.7');
            data.append('07 730.37 540.154 730.391C595.6');
            data.append('01 730.37 640.699 685.251 640.6');
            data.append('99 629.804C640.699 585.256 613.');
            data.append('245 546.786 568.464 487.724L568');
            data.append('.102 487.246C559.142 475.425 54');
            data.append('9.807 463.109 540.492 450.195H5');
            data.append('39.817C530.376 437.108 520.926 ');
            data.append('424.634 511.845 412.667C467.053');
            data.append(' 353.604 439.61 315.135 439.61 ');
            data.append('270.587C439.61 243.725 450.076 ');
            data.append('218.459 469.073 199.462C488.059');
            data.append(' 180.476 513.304 169.999 540.15');
            data.append('5 169.999C567.006 170.01 592.25');
            data.append('1 180.476 611.237 199.462C630.2');
            data.append('34 218.459 640.7 243.714 640.7 ');
            data.append('270.587C640.7 315.135 613.246 3');
            data.append('53.604 568.465 412.667L568.103 ');
            data.append('413.144C559.144 424.965 549.808');
            data.append(' 437.282 540.493 450.195H762.38');
            data.append('7C769.237 460.925 775.791 471.9');
            data.append('83 781.88 483.485C807.738 532.3');
            data.append('46 820.308 580.203 820.308 629.');
            data.append('804C820.308 667.597 812.886 704');
            data.append('.301 798.256 738.901C784.132 77');
            data.append('2.275 763.941 802.235 738.242 8');
            data.append('27.934C712.542 853.644 682.583 ');
            data.append('873.835 649.209 887.948C614.63 ');
            data.append('902.568 577.957 909.989 540.196');
            data.append(' 910H540.122C502.361 909.989 46');
            data.append('5.678 902.568 431.099 887.948C3');
            data.append('97.725 873.825 367.765 853.633 ');
            data.append('342.066 827.934C316.356 802.235');
            data.append(' 296.165 772.275 282.052 738.90');
            data.append('1C267.421 704.29 260 667.586 26');
            data.append('0 629.804C260 580.203 272.569 5');
            data.append('32.346 298.427 483.485C304.516 ');
            data.append('471.993 311.071 460.925 317.921');
            data.append(' 450.195H539.816C530.375 463.28');
            data.append('3 520.924 475.757 511.843 487.7');
            data.append('24Z\" fill=\"url(#grad)\" /> <d');
            data.append('efs> <linearGradient id=\"grad');
            data.append('\" x1=\"820.132\" y1=\"169.999');
            data.append('\" x2=\"820.132\" y2=\"910\" gra');
            data.append('dientUnits=\"userSpaceOnUse\"> ');
            data.append('<stop offset=\"0.177366\" stop-');
            data.append('color=\"#0AF2AD\" /> <stop offs');
            data.append('et=\"0.822634\" stop-color=\"#A');
            data.append('8C4EF\" /> </linearGradient> </');
            data.append('defs></svg>');
            data
        }

        fn get(self: @ContractState) -> Span<felt252> {
            let mut test = ArrayTrait::<felt252>::new();
            self.concat(test).span()
        }
    }
}

#[cfg(test)]
mod test {
    use array::{ArrayTrait, SpanTrait};
    use metadata::tests::utils::print_felt_span;
    use debug::PrintTrait;
    use test::test_utils::assert_eq;
    use traits::Into;
    use super::CarbonableLogo;

    #[test]
    #[available_gas(20000)]
    fn test_component_name() {
        let data: Span<felt252> = CarbonableLogo::__external::name(Default::default().span());
        let name: felt252 = *data[0];
        assert_eq(@name, @'Carbonable Logo', 'Couldn\'t get name');
    }

    #[test]
    #[available_gas(300000)]
    fn test_component_get() {
        let data: Span<felt252> = CarbonableLogo::__external::get(Default::default().span());
        assert_eq(@data.len(), @60_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
