import ol from 'openlayers/dist/ol-debug';
/**
 * @class ol.supermap.MapvCanvasLayer
 * @classdesc ��ͼ����ͼ��
 * @param options - {object} ����
 */
export default class MapvCanvasLayer {

    constructor(options) {
        this.options = options || {};
        this.enableMassClear = this.options.enableMassClear;
        this._map = options.map;
        this.paneName = this.options.paneName || 'mapPane';
        this.context = this.options.context || '2d';
        this.zIndex = this.options.zIndex || 2;
        this.mixBlendMode = this.options.mixBlendMode || null;
        this.width = options.width;
        this.height = options.height;
        this.initialize();
    }

    initialize() {
        var me = this;
        var canvas = me.canvas = document.createElement("canvas");
        canvas.style.cssText = "position:absolute;" + "left:0;" + "top:0;" + "z-index:" + me.zIndex + ";user-select:none;";
        canvas.style.mixBlendMode = me.mixBlendMode;
        canvas.className = "mapvClass";
        var global$2 = typeof window === 'undefined' ? {} : window;
        var devicePixelRatio = me.devicePixelRatio = global$2.devicePixelRatio;
        canvas.width = me.width;
        canvas.height = me.height;
        if (me.context == '2d') {
            canvas.getContext(me.context).scale(devicePixelRatio, devicePixelRatio);
        }
        canvas.style.width = canvas.width + "px";
        canvas.style.height = canvas.height + "px";
    }
    /**
     * @function ol.supermap.MapvCanvasLayer.prototype.draw
     * @description ���ɵ�ͼ
     */
    draw() {
        this.options.update && this.options.update.call(this);
    }

    /**
     * @function ol.supermap.MapvCanvasLayer.prototype.resize
     * @param mapWidth - {number} ��ͼ���
     * @param mapHeight - {number} ��ͼ�߶�
     * @description ������ͼ��С
     */
    resize(mapWidth, mapHeight) {
        this.canvas.width = mapWidth;
        this.canvas.height = mapHeight;
        this.canvas.style.width = mapWidth + "px";
        this.canvas.style.height = mapHeight + "px";
    }

    /**
     * @function ol.supermap.MapvCanvasLayer.prototype.getContainer
     * @description ��ȡ����
     * @return {Element}
     */
    getContainer() {
        return this.canvas;
    }
    /**
     * @function ol.supermap.MapvCanvasLayer.prototype.setZIndex
     * @param zIndex - {number} �㼶����
     * @description ����ͼ��㼶
     */
    setZIndex(zIndex) {
        this.canvas.style.zIndex = zIndex;
    }
    /**
     * @function ol.supermap.MapvCanvasLayer.prototype.getZIndex
     * @description ��ȡͼ��㼶
     */
    getZIndex() {
        return this.zIndex;
    }
}