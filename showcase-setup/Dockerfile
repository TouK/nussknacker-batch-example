FROM alpine:3.19.1

RUN apk --no-cache add curl
RUN apk --no-cache add jq

COPY ./createScenarios.sh /createScenarios.sh
COPY ./SumTransactions.json /SumTransactions.json
COPY ./GenerateTransactions.json /GenerateTransactions.json

RUN chmod +x /createScenarios.sh

CMD ["/createScenarios.sh"]
