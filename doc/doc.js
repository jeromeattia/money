def values_for_js
    my_data = MyModel.calculate_data
    respond_to do |format|
      format.json { render json: my_data.to_json }
    end
  end

  d3JSON = function(){
        d3.json("/folders/<%= @folder.id %>.json", function(error, data) {
            if (error) return console.warn(error);

            var folderChildren = [],
            circle;

            var svg = d3.select("body").selectAll("svg");

            circle = svg.selectAll("circle")
            .data(data.submissions, String);

            circle.enter().append("svg:a")
            .attr("xlink:href", function(d){
                return "http://localhost:3000/submissions/" + d.id;
            })
            .append("circle")
            .attr("cy", function(d) {return d.content.length * 5 + "px";})
            .attr("class", "floating")
            .attr("cx", function(d){
                return (d.content.length / 2) * 10 + "px";
            })
            .attr("r", function(d){ return (d.content.length / 2) * 1.2;});

            circle.exit().remove();

        });
    };

     <%= javascript_tag do %>
        var width = 960,
        height = 2200;

        var cluster = d3.layout.cluster()
        .size([height, width - 160]);

        var diagonal = d3.svg.diagonal()
        .projection(function(d) { return [d.y, d.x]; });

        var svg = d3.select("body").append("svg")
        .attr("width", width)
        .attr("height", height)
        .append("g")
        .attr("transform", "translate(40,0)");

        d3.json("/assets/flare.json", function(root) {
        var nodes = cluster.nodes(root),
        links = cluster.links(nodes);

        var link = svg.selectAll(".link")
        .data(links)
        .enter().append("path")
        .attr("class", "link")
        .attr("d", diagonal);

        var node = svg.selectAll(".node")
        .data(nodes)
        .enter().append("g")
        .attr("class", "node")
        .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; })

        node.append("circle")
        .attr("r", 4.5);

        node.append("text")
        .attr("dx", function(d) { return d.children ? -8 : 8; })
        .attr("dy", 3)
        .style("text-anchor", function(d) { return d.children ? "end" : "start"; })
        .text(function(d) { return d.name; });
        });

        d3.select(self.frameElement).style("height", height + "px");
    <% end %>

    var url = '/courses/1';
d3.json( url, function( error, data ) {
    console.log( data );
    // do all actions required now that the data is retrieved
} );