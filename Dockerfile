FROM jboss/keycloak:4.4.0.Final

COPY files/ /opt/jboss/keycloak/cli/
RUN cd /opt/jboss/keycloak && bin/jboss-cli.sh --file=cli/theme.cli && rm -rf /opt/jboss/keycloak/standalone/configuration/standalone_xml_history
RUN cd /opt/jboss/keycloak && bin/jboss-cli.sh --file=cli/theme_ha.cli && rm -rf /opt/jboss/keycloak/standalone/configuration/standalone_xml_history


COPY theme/ /opt/jboss/keycloak/themes/tinker/
