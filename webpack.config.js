const HtmlWebpackPlugin = require('html-webpack-plugin');
const VueLoaderPlugin = require('vue-loader/lib/plugin');

module.exports = {
    entry: './vue/main.js',
    output: {
        path: __dirname + '/dist'
    },
    module: {
        rules: [{
                test: /\.js$/,
                use: 'babel-loader'
            },
            {
                test: /\.vue$/,
                use: 'vue-loader'
            },
            {
                test: /\.css$/,
                use: ['vue-style-loader', 'css-loader']
            }//,
            //{
            //    test: /\.html$/,
            //    loader: 'mustache-loader'
            //}
        ]
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: './vue/public/index.html',
            favicon: './vue/public/favicon.ico',
        }),
        new VueLoaderPlugin(),
    ]
};