    function createAreaTooltip(layer) {
        if(layer.areaTooltip) {
            return;
        }

        layer.areaTooltip = L.tooltip({
            permanent: true,
            direction: 'center',
            className: 'area-tooltip'
        });

        layer.on('remove', function(event) {
            layer.areaTooltip.remove();
        });

        layer.on('add', function(event) {
            updateAreaTooltip(layer);
            layer.areaTooltip.addTo(map);
        });

        if(map.hasLayer(layer)) {
            updateAreaTooltip(layer);
            layer.areaTooltip.addTo(map);
        }
        }

    function updateAreaTooltip(layer) {
        var area = L.GeometryUtil.geodesicArea(layer.getLatLngs()[0]);
        var readableArea = L.GeometryUtil.readableArea((area * 6.25), true); //แก้ไขค่าเป็นไร่แล้ว 
        var latlng = layer.getCenter();


        layer.areaTooltip
            .setContent(readableArea)
            .setLatLng(latlng);
        }

