import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Products {
  int id;
  String symbol;
  String description;
  String createdAt;
  String updatedAt;
  String settlementTime;
  String productType;
  String pricingSource;
  int impactSize;
  int initialMargin;
  String maintenanceMargin;
  String contractValue;
  String contractUnitCurrency;
  String tickSize;
  String tradingStatus;
  String maxLeverageNotional;
  String defaultLeverage;
  String initialMarginScalingFactor;
  String maintenanceMarginScalingFactor;
  String commissionRate;
  String makerCommissionRate;
  String liquidationPenaltyFactor;
  String contractType;
  int positionSizeLimit;
  String basisFactorMaxLimit;
  bool isQuanto;
  String fundingMethod;
  String annualizedFunding;
  String priceBand;
  UnderlyingAsset underlyingAsset;
  UnderlyingAsset quotingAsset;
  UnderlyingAsset settlingAsset;

  Products(
      {this.id,
        this.symbol,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.settlementTime,
        this.productType,
        this.pricingSource,
        this.impactSize,
        this.initialMargin,
        this.maintenanceMargin,
        this.contractValue,
        this.contractUnitCurrency,
        this.tickSize,
        this.tradingStatus,
        this.maxLeverageNotional,
        this.defaultLeverage,
        this.initialMarginScalingFactor,
        this.maintenanceMarginScalingFactor,
        this.commissionRate,
        this.makerCommissionRate,
        this.liquidationPenaltyFactor,
        this.contractType,
        this.positionSizeLimit,
        this.basisFactorMaxLimit,
        this.isQuanto,
        this.fundingMethod,
        this.annualizedFunding,
        this.priceBand,
        this.underlyingAsset,
        this.quotingAsset,
        this.settlingAsset});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    settlementTime = json['settlement_time'];
    productType = json['product_type'];
    pricingSource = json['pricing_source'];
    impactSize = json['impact_size'];
    initialMargin = json['initial_margin'];
    maintenanceMargin = json['maintenance_margin'];
    contractValue = json['contract_value'];
    contractUnitCurrency = json['contract_unit_currency'];
    tickSize = json['tick_size'];
    tradingStatus = json['trading_status'];
    maxLeverageNotional = json['max_leverage_notional'];
    defaultLeverage = json['default_leverage'];
    initialMarginScalingFactor = json['initial_margin_scaling_factor'];
    maintenanceMarginScalingFactor = json['maintenance_margin_scaling_factor'];
    commissionRate = json['commission_rate'];
    makerCommissionRate = json['maker_commission_rate'];
    liquidationPenaltyFactor = json['liquidation_penalty_factor'];
    contractType = json['contract_type'];
    positionSizeLimit = json['position_size_limit'];
    basisFactorMaxLimit = json['basis_factor_max_limit'];
    isQuanto = json['is_quanto'];
    fundingMethod = json['funding_method'];
    annualizedFunding = json['annualized_funding'];
    priceBand = json['price_band'];
    underlyingAsset = json['underlying_asset'] != null
        ? new UnderlyingAsset.fromJson(json['underlying_asset'])
        : null;
    quotingAsset = json['quoting_asset'] != null
        ? new UnderlyingAsset.fromJson(json['quoting_asset'])
        : null;
    settlingAsset = json['settling_asset'] != null
        ? new UnderlyingAsset.fromJson(json['settling_asset'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['settlement_time'] = this.settlementTime;
    data['product_type'] = this.productType;
    data['pricing_source'] = this.pricingSource;
    data['impact_size'] = this.impactSize;
    data['initial_margin'] = this.initialMargin;
    data['maintenance_margin'] = this.maintenanceMargin;
    data['contract_value'] = this.contractValue;
    data['contract_unit_currency'] = this.contractUnitCurrency;
    data['tick_size'] = this.tickSize;
    data['trading_status'] = this.tradingStatus;
    data['max_leverage_notional'] = this.maxLeverageNotional;
    data['default_leverage'] = this.defaultLeverage;
    data['initial_margin_scaling_factor'] = this.initialMarginScalingFactor;
    data['maintenance_margin_scaling_factor'] =
        this.maintenanceMarginScalingFactor;
    data['commission_rate'] = this.commissionRate;
    data['maker_commission_rate'] = this.makerCommissionRate;
    data['liquidation_penalty_factor'] = this.liquidationPenaltyFactor;
    data['contract_type'] = this.contractType;
    data['position_size_limit'] = this.positionSizeLimit;
    data['basis_factor_max_limit'] = this.basisFactorMaxLimit;
    data['is_quanto'] = this.isQuanto;
    data['funding_method'] = this.fundingMethod;
    data['annualized_funding'] = this.annualizedFunding;
    data['price_band'] = this.priceBand;
    if (this.underlyingAsset != null) {
      data['underlying_asset'] = this.underlyingAsset.toJson();
    }
    if (this.quotingAsset != null) {
      data['quoting_asset'] = this.quotingAsset.toJson();
    }
    if (this.settlingAsset != null) {
      data['settling_asset'] = this.settlingAsset.toJson();
    }
    return data;
  }
}

class UnderlyingAsset {
  int id;
  String symbol;
  int precision;

  UnderlyingAsset({this.id, this.symbol, this.precision});

  UnderlyingAsset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    precision = json['precision'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['precision'] = this.precision;
    return data;
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Products>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Products> data = snapshot.data;
          return _firstPage(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return new Scaffold(
            body: new Center(
              child: new SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: const CircularProgressIndicator()),
            ));
      },
    );
  }

  Future<List<Products>> _fetchJobs() async {

    final dataListAPIUrl = 'https://api.delta.exchange/products';
    final response = await http.get(dataListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => new Products.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  ListView _firstPage(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].symbol, data[index].description, Icons.monetization_on);
        });
  }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );
}