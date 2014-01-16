var app = angular.module("MyApp", [])

app.directive("donutChart", () ->
	{
		scope: { 'data':'=',"onClick" = "&"},
		restrict:"E",
		link: (scope, element) -> 
			var color = d3.scale.category10();
			var el = element[0];
			var width = el.clientWidth;
			var height = el.clientHeight;
			var min = Math.min(width,height);
			var pie = d3.layout.pie().sort(null);
			var arc = d3.svg.arc()
				.outerRadius(min /2 * 0.9)
				.innerRadius(min /2 * 0.5);

			var svg, arcs;

			var init = () ->
				svg = d3.select(el).append("svg")
					.attr(width: width, height: height)
					.append('g')
					.attr('transform','translate(#{width / 2}, #{height / 2}');

				svg.on('mousedown', (d) -> 
					scope.$apply(()->
						if(scope.onClick)	scope.onClick();
					);
				);
	}
)