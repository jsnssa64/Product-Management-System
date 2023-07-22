const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const TsconfigPathsPlugin = require('tsconfig-paths-webpack-plugin');

module.exports = {
   entry: path.join(__dirname, "src", "main.tsx"),
   mode: 'development',
   devtool: 'inline-source-map',
   output: {
      path: path.resolve(__dirname, '/dist'),
   },
   devServer: {
      port: 8001,
      hot: true
   },
   module: {
      rules: [
         {
            test: /\.css$/i,
            use: ["style-loader", "css-loader"]
         },
         {
            test: /\.(png|jp(e*)g|svg|gif)$/,
            use: ['file-loader']
          },
          {
            test: /\.tsx?$/,
            use: 'ts-loader',
            exclude: /node_modules/,
          }
      ]
   },
   resolve: {
      extensions: ['.js', '.jsx', '.ts', '.tsx'],
      alias: {
         '@Common': path.resolve(__dirname, './src/common/'),
         '@Components': path.resolve(__dirname, './src/components/'),
         '@Data': path.resolve(__dirname, './src/data/'),
         '@Services': path.resolve(__dirname, './src/services/'),
         '@Pages': path.resolve(__dirname, './src/pages')
      }
   },
   plugins:[
      new HtmlWebpackPlugin({
         template: path.join(__dirname, "src", 'index.html')
      })
   ]
}